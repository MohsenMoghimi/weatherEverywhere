//
//  OWMain.swift
//  WeatherEverywhere
//
//  Created by Mohsen Moghimi on 10/3/19.
//  Copyright © 2019 Mohsen Moghimi. All rights reserved.
//

import Foundation

struct OWMain : Codable {
    let temp : Double?
    let pressure : Double?
    let humidity : Double?
    let temp_min : Double?
    let temp_max : Double?
    
    enum CodingKeys: String, CodingKey {
        
        case temp = "temp"
        case pressure = "pressure"
        case humidity = "humidity"
        case temp_min = "temp_min"
        case temp_max = "temp_max"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        temp = try values.decodeIfPresent(Double.self, forKey: .temp)
        pressure = try values.decodeIfPresent(Double.self, forKey: .pressure)
        humidity = try values.decodeIfPresent(Double.self, forKey: .humidity)
        temp_min = try values.decodeIfPresent(Double.self, forKey: .temp_min)
        temp_max = try values.decodeIfPresent(Double.self, forKey: .temp_max)
    }
    
}
