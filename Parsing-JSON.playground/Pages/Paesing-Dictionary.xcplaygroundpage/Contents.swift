import Foundation 

let json = """
{
 "results": [
   {
     "firstName": "John",
     "lastName": "Appleseed"
   },
  {
    "firstName": "Alex",
    "lastName": "Paul"
  }
 ]
}
""".data(using: .utf8)!

// Create Models
struct ResultWrapper: Decodable {
    let results: [Contact]
}

struct Contact: Decodable {
    let firstName: String
    let lastName: String
}


// Decode the JSON data
do {
    let dictionary = try JSONDecoder().decode(ResultWrapper.self, from: json)
    let contacts  = dictionary.results
    dump(contacts)
} catch {
  print("could not parse")
}
