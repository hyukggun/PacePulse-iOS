import Foundation

public extension Date {

    enum DateComponentUnit {
        case year(Int)
        case month(Int)
        case day(Int)
        case hour(Int)
        case minute(Int)
        case second(Int)

        var dateComponentValue: DateComponents {
            switch self {
            case .year(let value):
                return DateComponents(year: value)
            case .month(let value):
                return DateComponents(month: value)
            case .day(let value):
                return DateComponents(day: value)
            case .hour(let value):
                return DateComponents(hour: value)
            case .minute(let value):
                return DateComponents(minute: value)
            case .second(let value):
                return DateComponents(second: value)
            }
        }

        var intValue: Int {
            switch self {
            case .year(let value):
                return value
            case .month(let value):
                return value
            case .day(let value):
                return value
            case .hour(let value):
                return value
            case .minute(let value):
                return value
            case .second(let value):
                return value
            }
        }

        static prefix func - (lhs: DateComponentUnit) -> DateComponentUnit {
            switch lhs {
            case .year(let value):
                return .year(-value)
            case .month(let value):
                return .month(-value)
            case .day(let value):
                return .day(-value)
            case .hour(let value):
                return .hour(-value)
            case .minute(let value):
                return .minute(-value)
            case .second(let value):
                return .second(-value)
            }
        }
    }

    static func + (lhs: Date, rhs: DateComponentUnit) -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: rhs.dateComponentValue, to: lhs)!
    }

    static func - (lhs: Date, rhs: DateComponentUnit) -> Date {
        return lhs + (-rhs)
    }

    var firstDayOfMonth: Date {
        let calendar = Calendar.current
        if let monthInterval = calendar.dateInterval(of: .month, for: self) {
            return monthInterval.start
        } else {
            // 문제가 발생할 경우 현재 날짜를 반환하거나 적절히 처리할 수 있습니다.
            return self
        }
    }

    var nextWeekday: Date {
        let calendar = Calendar.current
        let nextWeekday = calendar.date(byAdding: .day, value: 1, to: self)!
        return nextWeekday
    }

    var lastDayOfMonth: Date {
        let calendar = Calendar.current
        let range = calendar.range(of: .day, in: .month, for: self)!
        let lastDay = range.count
        return calendar.date(byAdding: .day, value: lastDay - 1, to: firstDayOfMonth)!
    }

    func monthDates() -> [Date] {
        let calendar = Calendar.current
        guard let monthInterval = calendar.dateInterval(of: .month, for: self) else { return [] }
        var results = Set<Date>()
        for date in stride(from: monthInterval.start, to: monthInterval.end, by: 86400) {
            if date == monthInterval.start || date == monthInterval.end {
                results.formUnion(date.weekDays())
                continue
            }
            results.insert(date)
        }
        return Array(results.sorted())
    }

    var month: Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.month], from: self)
        return components.month ?? 0
    }

    var weekDay: Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.weekday], from: self)
        return components.weekday ?? 0
    }

    func weekDays() -> [Date] {
        let calendar = Calendar.current
        guard let weekDayInterval = calendar.dateInterval(of: .weekOfMonth, for: self) else {
            return []
        }
        print("start ", weekDayInterval.start, "end ", weekDayInterval.end)
        return stride(from: weekDayInterval.start, to: weekDayInterval.end, by: 86400).map { $0 }
    }

    func toFormattedString(dateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: self)
    }

}
