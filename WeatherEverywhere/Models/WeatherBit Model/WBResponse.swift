//
//  WBResponse.swift
//  WeatherEverywhere
//
//  Created by Mohsen Moghimi on 10/3/19.
//  Copyright © 2019 Mohsen Moghimi. All rights reserved.
//

import Foundation

struct WBResponse : Codable {
    let data : [WBData]?
    let count : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case data = "data"
        case count = "count"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent([WBData].self, forKey: .data)
        count = try values.decodeIfPresent(Int.self, forKey: .count)
    }
    
}

