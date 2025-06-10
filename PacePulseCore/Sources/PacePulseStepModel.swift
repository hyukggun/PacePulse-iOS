//
//  PacePulseStepModel.swift
//  PacePulse-HealthKit
//
//  Created by hyukmac on 6/4/25.
//

import Foundation

public protocol PacePulseStepRepresentable {
    var date: Date { get }
    var steps: Double { get }
}

public protocol PacePulseDistanceRepresentable {
    var date: Date { get }
    var distance: Double { get }
}

public struct PacePulseDistanceModel: PacePulseDistanceRepresentable, CustomStringConvertible {
    public var description: String {
        String(format: "Date: %@, Distance: %@",
               date.toFormattedString(dateFormat: "yyyy-MM-dd"),
               String(format: "%.2f", distance))
    }
    
    public let date: Date
    public let distance: Double
    
    public init(date: Date, distance: Double) {
        self.date = date
        self.distance = distance
    }
}

public struct PacePulseStepModel: PacePulseStepRepresentable, CustomStringConvertible {
    public var description: String {
        String(format: "Date: %@, Steps:%@",
               date.toFormattedString(dateFormat: "yyyy-MM-dd"),
               String(format: "%.2f", steps))
    }
    
    public let date: Date
    public let steps: Double
    
    public init(date: Date, steps: Double) {
        self.date = date
        self.steps = steps
    }
}
