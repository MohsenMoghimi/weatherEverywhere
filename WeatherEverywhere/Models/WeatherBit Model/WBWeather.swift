//
//  WBWeather.swift
//  WeatherEverywhere
//
//  Created by Mohsen Moghimi on 10/3/19.
//  Copyright © 2019 Mohsen Moghimi. All rights reserved.
//

import Foundation

struct WBWeather : Codable {
    let icon : String?
    let code : String?
    let description : String?
    
    enum CodingKeys: String, CodingKey {
        
        case icon = "icon"
        case code = "code"
        case description = "description"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        icon = try values.decodeIfPresent(String.self, forKey: .icon)
        code = try values.decodeIfPresent(String.self, forKey: .code)
        description = try values.decodeIfPresent(String.self, forKey: .description)
    }
    
}
