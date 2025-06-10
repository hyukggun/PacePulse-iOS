//
//  ChartView.swift
//  PacePulse-App
//
//  Created by hyukmac on 6/5/25.
//

import Charts
import SwiftUI
import PacePulseCore

extension PacePulseDistanceModel: @retroactive Identifiable {
    public var id: Date {
        self.date
    }
}

struct ChartView: View {
    let distanceModels: [PacePulseDistanceModel] = [
        .init(date: Date.now + .day(-3), distance: 1000),
        .init(date: Date.now + .day(-2), distance: 20_000),
        .init(date: Date.now + .day(-1), distance: 400),
        .init(date: Date.now, distance: 5000),
    ]
    
    var averageDistance: Double {
        distanceModels.reduce(0) { $0 + $1.distance } / Double(distanceModels.count)
    }
    
    @State
    var selectedDistanceModel: PacePulseDistanceModel?
    
    @State
    var isAverageShowEnabled: Bool = false
    
    func updateSelectedMonth(at location: CGPoint, proxy: ChartProxy, geometry: GeometryProxy) {
        guard let plotFrame = proxy.plotFrame else {
            return
        }
        let xPosition = location.x - geometry[plotFrame].origin.x
        
        guard let month: String = proxy.value(atX: xPosition) else {
            return
        }
        selectedDistanceModel = distanceModels.first(where: { $0.date.toFormattedString(dateFormat: "yyyy-MM-dd") == month })
    }
    
    var body: some View {
        Chart {
            ForEach(distanceModels) { d in
                BarMark(
                    x: .value("Date",
                              d.date.toFormattedString(dateFormat: "yyyy-MM-dd")),
                    y: .value("Distance", d.distance)
                )
                .foregroundStyle(d.distance >= 5_000 ? .blue : .red)
                .annotation(position: .automatic) {
                    Text(d.distance.formatted())
                }
            }
            if isAverageShowEnabled {
                RuleMark(y: .value("Averge Distance", averageDistance))
                    .annotation(position: .top) {
                        Text("Average Distance")
                    }
            }
        }
        .chartOverlay { proxy in
                GeometryReader { geometry in
                    ZStack(alignment: .top) {
                        Rectangle()
                            .fill(.clear)
                            .contentShape(Rectangle())
                            .onTapGesture { location in
                                print("plotSize", proxy.plotSize)
                                print("plotContainerFrame", proxy.plotContainerFrame)
                                print(geometry.size)
                                updateSelectedMonth(at: location, proxy: proxy, geometry: geometry)

                            }
                            .onLongPressGesture {
                                isAverageShowEnabled.toggle()
                            }
                     }
                }
            }
    }
}

#Preview {
    ChartView()
}
