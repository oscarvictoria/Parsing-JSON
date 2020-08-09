//
//  APIClient.swift
//  Parsing-JSON-URLSession
//
//  Created by Oscar Victoria Gonzalez  on 8/4/20.
//  Copyright © 2020 Oscar Victoria Gonzalez . All rights reserved.
//

import Foundation

enum AppError: Error {
    case badURL(String)
    case networkError(Error)
    case decodingError(Error)
}

class APIClient {
    func fetchData(completion: @escaping (Result <[Station], AppError>)-> ()) {
        let endpoint = "https://gbfs.citibikenyc.com/gbfs/en/station_information.json"
        
        guard let url = URL(string: endpoint) else {
            completion(.failure(.badURL(endpoint)))
            return
        }
        
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(.networkError(error)))
                return
            }
            if let data = data {
                
                do {
                    let results = try JSONDecoder().decode(ResultsWrapper.self, from: data)
                    completion(.success(results.data.stations))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
                
            }
        }
        dataTask.resume()
    }
    
    
    func fetchDataUsingToken(completion: @escaping (Result <[Businesses], AppError>)-> ()) {
        
        let endpoint = "https://api.yelp.com/v3/businesses/search?location=newyork&term=5napkin"
        
        let token = Keys.token
        
        
        guard let url = URL(string: endpoint) else {
            completion(.failure(.badURL(endpoint)))
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        request.addValue("Bearer " + token, forHTTPHeaderField: "Authorization")
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(.networkError(error)))
                return
            }
            if let data = data {
                do {
                    let results = try JSONDecoder().decode(ResultsWrapperYelp.self, from: data)
                    completion(.success(results.businesses))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
        
        dataTask.resume()
    }
}
