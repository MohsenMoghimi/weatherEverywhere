//
//  OWResponse.swift
//  WeatherEverywhere
//
//  Created by Mohsen Moghimi on 10/3/19.
//  Copyright © 2019 Mohsen Moghimi. All rights reserved.
//

import Foundation
struct OWResponse : Codable {
    let message : String?
    let cod : String?
    let count : Int?
    let list : [OWList]?
    
    enum CodingKeys: String, CodingKey {
        
        case message = "message"
        case cod = "cod"
        case count = "count"
        case list = "list"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        cod = try values.decodeIfPresent(String.self, forKey: .cod)
        count = try values.decodeIfPresent(Int.self, forKey: .count)
        list = try values.decodeIfPresent([OWList].self, forKey: .list)
    }
    
}
