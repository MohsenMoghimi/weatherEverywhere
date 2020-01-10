//
//  OWSys.swift
//  WeatherEverywhere
//
//  Created by Mohsen Moghimi on 10/3/19.
//  Copyright © 2019 Mohsen Moghimi. All rights reserved.
//

import Foundation

struct OWSys : Codable {
    let country : String?
    
    enum CodingKeys: String, CodingKey {
        
        case country = "country"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        country = try values.decodeIfPresent(String.self, forKey: .country)
    }
    
}
