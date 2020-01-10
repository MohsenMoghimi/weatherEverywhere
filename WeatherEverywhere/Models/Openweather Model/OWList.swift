
//
//  OWList.swift
//  WeatherEverywhere
//
//  Created by Mohsen Moghimi on 10/3/19.
//  Copyright © 2019 Mohsen Moghimi. All rights reserved.
//

import Foundation

struct OWList : Codable {
    let id : Int?
    let name : String?
    let coord : OWCoord?
    let main : OWMain?
    let dt : Int?
    let wind : OWWind?
    let sys : OWSys?
//    let rain : String?
//    let snow : String?
    let clouds : OWClouds?
    let weather : [OWWeather]?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case name = "name"
        case coord = "coord"
        case main = "main"
        case dt = "dt"
        case wind = "wind"
        case sys = "sys"
//        case rain = "rain"
//        case snow = "snow"
        case clouds = "clouds"
        case weather = "weather"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        coord = try values.decodeIfPresent(OWCoord.self, forKey: .coord)
        main = try values.decodeIfPresent(OWMain.self, forKey: .main)
        dt = try values.decodeIfPresent(Int.self, forKey: .dt)
        wind = try values.decodeIfPresent(OWWind.self, forKey: .wind)
        sys = try values.decodeIfPresent(OWSys.self, forKey: .sys)
//        rain = try values.decodeIfPresent(String.self, forKey: .rain)
//        snow = try values.decodeIfPresent(String.self, forKey: .snow)
        clouds = try values.decodeIfPresent(OWClouds.self, forKey: .clouds)
        weather = try values.decodeIfPresent([OWWeather].self, forKey: .weather)
    }
    
}
