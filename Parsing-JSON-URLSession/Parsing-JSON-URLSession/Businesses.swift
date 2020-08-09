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
}

