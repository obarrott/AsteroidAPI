//
//  File.swift
//  AsteroidChecker
//
//  Created by Owen Barrott on 9/23/20.
//  Copyright © 2020 Owen Barrott. All rights reserved.
//

import Foundation

//https://api.nasa.gov/neo/rest/v1/feed/today?api_key=Ji5s7yc5PFy23kHntBGm3867T3em9Xlekj56MFgA

struct StringConstants {
    fileprivate static let baseURLString = "https://api.nasa.gov/neo/rest/v1/feed/today"
    fileprivate static let aPIKey = "Ji5s7yc5PFy23kHntBGm3867T3em9Xlekj56MFgA"
}

class AsteroidController {
    
    static func fetchAsteroids(completion: @escaping (Result<[Asteroid], AsteroidError>) -> Void) {
        
        guard let baseURL = URL(string: StringConstants.baseURLString) else {return completion(.failure(.invalidURL))}
        
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true )
        let apiKey = URLQueryItem(name: "api_key", value: StringConstants.aPIKey)
        
        components?.queryItems = [apiKey]
        
        guard let finalURL = components?.url else {return completion(.failure(.invalidURL))}
        print(finalURL)
        
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            guard let data = data else {return completion(.failure(.noData))}
            
            do {
                let topLevelDictionary = try JSONDecoder().decode(TopLevelDictionary.self, from: data)
                let asteroids = topLevelDictionary.near_earth_objects.asteroid
                return completion(.success(asteroids))
            } catch {
                print(error)
                print(error.localizedDescription)
                return completion(.failure(.unableToDecode(error)))
            }
        }.resume()
    }
}
