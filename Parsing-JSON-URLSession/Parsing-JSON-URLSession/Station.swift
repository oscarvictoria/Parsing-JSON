//
//  Station.swift
//  Parsing-JSON-URLSession
//
//  Created by Oscar Victoria Gonzalez  on 8/4/20.
//  Copyright © 2020 Oscar Victoria Gonzalez . All rights reserved.
//

import Foundation

struct ResultsWrapper: Decodable {
    let data: StationsWrapper
}
struct StationsWrapper: Decodable {
    let stations: [Station]
}
struct Station: Decodable, Hashable {
    let stationType: String
    let lat: Double
    let lon: Double
    let capacity: Int
    let name: String
    private enum CodingKeys: String, CodingKey {
        case stationType = "station_type"
        case lat
        case lon
        case capacity
        case name
    }
}
