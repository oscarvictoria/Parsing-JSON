//
//  Businesses.swift
//  Parsing-JSON-URLSession
//
//  Created by Oscar Victoria Gonzalez  on 8/8/20.
//  Copyright © 2020 Oscar Victoria Gonzalez . All rights reserved.
//

import Foundation

struct ResultsWrapperYelp: Codable {
    let businesses: [Businesses]
}

struct Businesses: Codable {
    let id: String
    let name: String
    let isClosed: Bool
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case isClosed = "is_closed"
    }
}

