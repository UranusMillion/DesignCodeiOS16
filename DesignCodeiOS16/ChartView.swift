//
//  ChartView.swift
//  DesignCodeiOS16
//
//  Created by leonlee on 2023/2/15.
//

import SwiftUI
import Charts

struct ChartView: View {
    var body: some View {
        VStack {
//            Chart {
//                ForEach(data) { item in
//                    BarMark(x: .value("Day", item.day), y: .value("Value", item.value)).cornerRadius(10)
//                }
//            }
//            .foregroundStyle(.linearGradient(colors: [.blue,.purple], startPoint: .top, endPoint: .bottom))
//            .frame(height: 300)
//            .padding(.bottom,30)
            Chart {
                ForEach(data) { item in
                    LineMark(x: .value("Day", item.day), y: .value("Value", item.value),series: .value("Year", "2023"))
                        .cornerRadius(10)
                        .interpolationMethod(.catmullRom)
                        .foregroundStyle(by:.value("Year", "2023"))
                        .symbol(by: .value("Year", "2023"))
                    
                }
                ForEach(data2) { item in
                    LineMark(x: .value("Day", item.day), y: .value("Value", item.value),series: .value("Year", "2022"))
                        .cornerRadius(10)
                        .interpolationMethod(.catmullRom)
                        .foregroundStyle(by:.value("Year", "2022"))
                        .symbol(by: .value("Year", "2022"))
                    
                }
            }
            .frame(height: 300)
            .padding(30)
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}

struct Value: Identifiable {
    var id = UUID()
    var day: String
    var value: Double
}

let data: [Value] = [
    .init(day: "Jun 1", value: 200),
    .init(day: "Jun 2", value: 96),
    .init(day: "Jun 3", value: 312),
    .init(day: "Jun 4", value: 256),
    .init(day: "Jun 5", value: 505)
]

let data2: [Value] = [
    .init(day: "Jun 1", value: 151),
    .init(day: "Jun 2", value: 192),
    .init(day: "Jun 3", value: 176),
    .init(day: "Jun 4", value: 158),
    .init(day: "Jun 5", value: 401)
]
