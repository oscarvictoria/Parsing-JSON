//
//  Bundle + ParsingJSON.swift
//  Parsing-JSON-Using-Bundle
//
//  Created by Oscar Victoria Gonzalez  on 8/3/20.
//  Copyright © 2020 Oscar Victoria Gonzalez . All rights reserved.
//

import Foundation

enum BundleError: Error {
    case invalidResource(String)
    case noContents(String)
    case decodingError(Error)
}

extension Bundle {
    func parseJSON(with name: String) throws -> [President] {
        guard let path = Bundle.main.path(forResource: name, ofType: ".json") else {
            throw BundleError.invalidResource(name)
        }
        
        guard let data = FileManager.default.contents(atPath: path) else {
            throw BundleError.noContents(path)
        }
        
        var presidents: [President]
        
        do {
          presidents = try JSONDecoder().decode([President].self, from: data)
        } catch {
            throw BundleError.decodingError(error)
        }
        
        return presidents
    }
}
