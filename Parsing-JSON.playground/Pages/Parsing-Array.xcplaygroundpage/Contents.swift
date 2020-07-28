//: [Previous](@previous)

import Foundation

let json = """
[
    {
        "title": "New York",
        "location_type": "City",
        "woeid": 2459115,
        "latt_long": "40.71455,-74.007118"
    }
]
""".data(using: .utf8)!

struct City: Codable {
    let title: String
    let locationType: String
//    let location_type: String
    let woeid: Int
//    let latt_long: String
    let coordinate: String
    
    private enum CodingKeys: String, CodingKey {
        case title
        case locationType = "location_type"
        case woeid
        case coordinate = "latt_long"
    }
}



do {
    let weatherArray = try JSONDecoder().decode([City].self, from: json)
    dump(weatherArray)
} catch {
    print("could not parse data \(error)")
}
