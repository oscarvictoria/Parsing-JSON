//
//  Parsing_JSON_Using_BundleTests.swift
//  Parsing-JSON-Using-BundleTests
//
//  Created by Oscar Victoria Gonzalez  on 8/3/20.
//  Copyright © 2020 Oscar Victoria Gonzalez . All rights reserved.
//

import XCTest
@testable import Parsing_JSON_Using_Bundle

class Parsing_JSON_Using_BundleTests: XCTestCase {
    
    func testModel() {
        // Arrange
    let json = """
        [{
        "number": 1,
        "president": "George Washington",
        "birth_year": 1732,
        "death_year": 1799,
        "took_office": "1789-04-30",
        "left_office": "1797-03-04",
        "party": "No Party"
        },
        {
        "number": 2,
        "president": "John Adams",
        "birth_year": 1735,
        "death_year": 1826,
        "took_office": "1797-03-04",
        "left_office": "1801-03-04",
        "party": "Federalist"
        }
        ]
        """.data(using: .utf8)!
        
        let expectedFirtPresident = "George Washington"
        
        // Act
        
        do {
            let presidents = try JSONDecoder().decode([President].self, from: json)
            XCTAssertEqual(expectedFirtPresident, presidents[0].name)
        } catch {
            print("error \(error.localizedDescription)")
        }
        
        // Assert
    }
    
    func testParseJSONFromBundle() {
        let bundle = Bundle.main
        let fileName = "president"
        let firstBlackPresident = "Barack Obama"
        
        do {
            let presidents = try bundle.parseJSON(with: fileName)
            XCTAssertEqual(firstBlackPresident, presidents[45].name)
        } catch {
            print("error \(error)")
        }
    }
    
}
