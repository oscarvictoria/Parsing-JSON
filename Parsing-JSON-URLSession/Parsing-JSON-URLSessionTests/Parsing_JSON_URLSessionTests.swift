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
    
    func testBusinessesModel() {
        let json = """
{
    "businesses": [{
            "id": "ubgvCM3_MvS7YCn4LJ7yCA",
            "alias": "5-napkin-burger-new-york-3",
            "name": "5 Napkin Burger",
            "image_url": "https://s3-media3.fl.yelpcdn.com/bphoto/xRhbw8ByyMFw5s5l37JhXw/o.jpg",
            "is_closed": false,
            "url": "https://www.yelp.com/biz/5-napkin-burger-new-york-3?adjust_creative=mAv2FeqBzxToX2i2jM2Nqw&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=mAv2FeqBzxToX2i2jM2Nqw",
            "review_count": 820,
            "categories": [{
                "alias": "burgers",
                "title": "Burgers"
            }],
            "rating": 3.5,
            "coordinates": {
                "latitude": 40.7332438,
                "longitude": -73.9874588
            },
            "transactions": [
                "pickup",
                "delivery"
            ],
            "price": "$$",
            "location": {
                "address1": "150 E 14th St",
                "address2": "",
                "address3": "",
                "city": "New York",
                "zip_code": "10003",
                "country": "US",
                "state": "NY",
                "display_address": [
                    "150 E 14th St",
                    "New York, NY 10003"
                ]
            },
            "phone": "+12122285500",
            "display_phone": "(212) 228-5500",
            "distance": 4137.455842029876
        },
        {
            "id": "x2ATnp8-hXFhr_XznPYPMw",
            "alias": "5-napkin-burger-new-york",
            "name": "5 Napkin Burger",
            "image_url": "https://s3-media2.fl.yelpcdn.com/bphoto/c6ms0ZcdfIWlxCKdt1ghEw/o.jpg",
            "is_closed": false,
            "url": "https://www.yelp.com/biz/5-napkin-burger-new-york?adjust_creative=mAv2FeqBzxToX2i2jM2Nqw&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=mAv2FeqBzxToX2i2jM2Nqw",
            "review_count": 2071,
            "categories": [{
                "alias": "burgers",
                "title": "Burgers"
            }],
            "rating": 3.5,
            "coordinates": {
                "latitude": 40.76018,
                "longitude": -73.991093
            },
            "transactions": [
                "pickup",
                "delivery"
            ],
            "price": "$$",
            "location": {
                "address1": "630 9th Ave",
                "address2": "",
                "address3": "",
                "city": "New York",
                "zip_code": "10036",
                "country": "US",
                "state": "NY",
                "display_address": [
                    "630 9th Ave",
                    "New York, NY 10036"
                ]
            },
            "phone": "+12127572277",
            "display_phone": "(212) 757-2277",
            "distance": 7144.255920952693
        }
    ]
}
""".data(using: .utf8)!
        
        let expectedStatus = false
        
        do {
            let results = try JSONDecoder().decode(ResultsWrapperYelp.self, from: json)
            let businesses = results.businesses
            let firstBusinessStatus = businesses[0].isClosed
            XCTAssertEqual(expectedStatus, firstBusinessStatus)
        } catch {
            XCTFail("\(error)")
        }
    }
    
    
}
    
    
    
