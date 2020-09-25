//
//  Asteroid.swift
//  AsteroidChecker
//
//  Created by Owen Barrott on 9/23/20.
//  Copyright © 2020 Owen Barrott. All rights reserved.
//

import Foundation

struct TopLevelDictionary: Decodable {
    let near_earth_objects: SecondLevelDictionary
    
}

struct SecondLevelDictionary: Decodable {
    let asteroid: [Asteroid]
    
    enum CodingKeys: String, CodingKey {
        case asteroid = "2020-09-25"
    }
}

struct Asteroid: Decodable {
    let name: String
    let is_potentially_hazardous_asteroid: Bool
    let estimated_diameter: DiameterDictionary
}

struct DiameterDictionary: Decodable {
    let meters: MeterDictionary
}

struct MeterDictionary: Decodable {
    let estimated_diameter_min: Double
    let estimated_diameter_max: Double
}






//let estimated_diameter: FourthLevelDiameterObject
   //let close_approach_data: [FourthLevelCloseApproachDataObject]

//struct FourthLevelDiameterObject: Decodable {
//    let meters: FifthLevelMeterObject
//}
//
//struct FifthLevelMeterObject: Decodable {
//    let estimated_diameter_min: Double
//    let estimated_diameter_max: Double
//}
//
//struct FourthLevelCloseApproachDataObject: Decodable {
//    let close_approach_date: String
//    let miss_distance: FifthLevelMissDistanceObject
//}
//
//struct FifthLevelMissDistanceObject: Decodable {
//    let lunar: String
//    let kilometers: String
//}
//
//struct Asteroid {
//    let name: String
//    let estimated_diameter_min: Double
//    let estimated_diameter_max: Double
//    let is_potentially_hazardous_asteroid: Bool
//    let close_approach_date: String
//    let lunar: String
//    let kilometers: String
//}
