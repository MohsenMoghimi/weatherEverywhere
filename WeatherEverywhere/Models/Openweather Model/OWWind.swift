//
//  OWWind.swift
//  WeatherEverywhere
//
//  Created by Mohsen Moghimi on 10/3/19.
//  Copyright © 2019 Mohsen Moghimi. All rights reserved.
//

import Foundation

struct OWWind : Codable {
    let speed : Double?
    let deg : Double?
    
    enum CodingKeys: String, CodingKey {
        
        case speed = "speed"
        case deg = "deg"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        speed = try values.decodeIfPresent(Double.self, forKey: .speed)
        deg = try values.decodeIfPresent(Double.self, forKey: .deg)
    }
    
}
