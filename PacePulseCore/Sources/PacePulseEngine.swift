import HealthKit

public enum PacePulseEngineState: Equatable {
    case suspend
    case ready
    case healthKitError(HKError)
    case normalError(any Error)
    
    public static func ==(lhs: Self, rhs: Self) -> Bool {
        if case .suspend = lhs, case .suspend = rhs {
            return true
        }
        if case .ready = lhs, case .ready = rhs {
            return true
        }
        if case let .healthKitError(lError) = lhs, case let .healthKitError(rError) = rhs {
            return lError.errorCode == rError.errorCode
        }
        if case let .normalError(lError) = lhs, case let .normalError(rError) = rhs {
            return lError.localizedDescription == rError.localizedDescription
        }
        return false
    }
}

open class PacePulseEngine {
    
    private let healthStore = HKHealthStore()
    
    private var qunatityTypes: Set<HKQuantityType> {
        [
            HKQuantityType(.runningSpeed),
            HKQuantityType(.distanceWalkingRunning)
        ]
    }
    
    public static var shared: PacePulseEngine { PacePulseEngine() }
    
    private var _engineState: PacePulseEngineState = .suspend
    
    private let engineStateLock = NSRecursiveLock()
    
    public var engineState: PacePulseEngineState {
        get {
            engineStateLock.lock()
            defer { engineStateLock.unlock() }
            return _engineState
        }
    }
    
    public init() {
        
    }
    
    public func initialize() async {
        do {
            try await healthStore.requestAuthorization(toShare: qunatityTypes, read: qunatityTypes)
            self._engineState = .ready
        } catch (let error as HKError) {
            self._engineState = .healthKitError(error)
        } catch {
            self._engineState = .normalError(error)
        }
    }
    
    public func getWalkingNRunningDistance(from startDate: Date, to endDate: Date) async -> [PacePulseDistanceModel] {
        let predicate = HKQuery.predicateForSamples(
            withStart: startDate,
            end: endDate,
            options: [.strictStartDate, .strictEndDate]
        )
        
        let interval = DateComponents(day: 1)
        
//        let query = HKStatisticsCollectionQuery(
//            quantityType: HKQuantityType(.distanceWalkingRunning),
//            quantitySamplePredicate: predicate,
//            anchorDate: startDate,
//            intervalComponents: interval
//        )
        
        let asyncQuery = HKStatisticsCollectionQueryDescriptor(
            predicate: HKSamplePredicate.quantitySample(type: HKQuantityType(.distanceWalkingRunning), predicate: predicate),
            options: .cumulativeSum,
            anchorDate: startDate,
            intervalComponents: interval)
            
        
        guard let result = try? await asyncQuery.result(for: healthStore) else {
            return []
        }
        
        let statistics = result.statistics()
        
        let distanceModels = statistics.map {
            let distance = $0.sumQuantity()?.doubleValue(for: .meter()) ?? .zero
            return PacePulseDistanceModel(date: $0.startDate, distance: distance)
        }
        
        distanceModels.forEach { print($0) }
        
        return distanceModels
//        query.initialResultsHandler = { query, results, error in
//            guard error == nil else {
//                return
//            }
//            
//            guard let results else {
//                return
//            }
//            let statistics = results.statistics()
//            
//            let distanceModels = statistics.map {
//                let distance = $0.sumQuantity()?.doubleValue(for: .meter()) ?? .zero
//                return PacePulseDistanceModel(date: $0.startDate, distance: distance)
//            }
//            
//            distanceModels.forEach { print($0) }
//        }
//        healthStore.execute(query)
    }
}
