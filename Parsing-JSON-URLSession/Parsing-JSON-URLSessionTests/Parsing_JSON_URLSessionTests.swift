//
//  Parsing_JSON_URLSessionTests.swift
//  Parsing-JSON-URLSessionTests
//
//  Created by Oscar Victoria Gonzalez  on 8/4/20.
//  Copyright © 2020 Oscar Victoria Gonzalez . All rights reserved.
//

import XCTest
@testable import Parsing_JSON_URLSession

class Parsing_JSON_URLSessionTests: XCTestCase {

    func testModel() {
        let json = """
        {
            "data": {
                "stations": [{
                        "lat": 40.76727216,
                        "station_id": "72",
                        "lon": -73.99392888,
                        "rental_url": "http://app.citibikenyc.com/S6Lr/IBV092JufD?station_id=72",
                        "eightd_has_key_dispenser": false,
                        "legacy_id": "72",
                        "region_id": "71",
                        "station_type": "classic",
                        "capacity": 55,
                        "has_kiosk": true,
                        "external_id": "66db237e-0aca-11e7-82f6-3863bb44ef7c",
                        "electric_bike_surcharge_waiver": false,
                        "rental_methods": [
                            "CREDITCARD",
                            "KEY"
                        ],
                        "short_name": "6926.01",
                        "name": "W 52 St & 11 Ave",
                        "eightd_station_services": []
                    },
                    {
                        "lat": 40.71911552,
                        "station_id": "79",
                        "lon": -74.00666661,
                        "rental_url": "http://app.citibikenyc.com/S6Lr/IBV092JufD?station_id=79",
                        "eightd_has_key_dispenser": false,
                        "legacy_id": "79",
                        "region_id": "71",
                        "station_type": "classic",
                        "capacity": 33,
                        "has_kiosk": true,
                        "external_id": "66db269c-0aca-11e7-82f6-3863bb44ef7c",
                        "electric_bike_surcharge_waiver": false,
                        "rental_methods": [
                            "CREDITCARD",
                            "KEY"
                        ],
                        "short_name": "5430.08",
                        "name": "Franklin St & W Broadway",
                        "eightd_station_services": []
                    }
                ]
            }
        }
        """.data(using: .utf8)!
        
        let expectedCapasity = 55
        do {
            let results = try JSONDecoder().decode(ResultsWrapper.self, from: json)
            let stations = results.data.stations
            let firstStation = stations[0]
            XCTAssertEqual(expectedCapasity, firstStation.capacity)
        } catch {
            XCTFail("decoding error: \(error)")
        }
    }
    

}
