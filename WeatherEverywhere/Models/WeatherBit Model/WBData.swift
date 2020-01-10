//
//  WBData.swift
//  WeatherEverywhere
//
//  Created by Mohsen Moghimi on 10/3/19.
//  Copyright © 2019 Mohsen Moghimi. All rights reserved.
//

import Foundation
struct WBData : Codable {
    let rh : Int?
    let pod : String?
    let lon : Double?
    let pres : Double?
    let timezone : String?
    let ob_time : String?
    let country_code : String?
    let clouds : Int?
    let ts : Int?
    let solar_rad : Double?
    let state_code : String?
    let city_name : String?
    let wind_spd : Double?
    let last_ob_time : String?
    let wind_cdir_full : String?
    let wind_cdir : String?
    let slp : Int?
    let vis : Int?
    let h_angle : Int?
    let sunset : String?
    let dni : Double?
    let dewpt : Double?
    let snow : Int?
    let uv : Double?
    let precip : Int?
    let wind_dir : Int?
    let sunrise : String?
    let ghi : Double?
    let dhi : Double?
    let aqi : Int?
    let lat : Double?
    let weather : WBWeather?
    let datetime : String?
    let temp : Int?
    let station : String?
    let elev_angle : Double?
    let app_temp : Double?
    
    enum CodingKeys: String, CodingKey {
        
        case rh = "rh"
        case pod = "pod"
        case lon = "lon"
        case pres = "pres"
        case timezone = "timezone"
        case ob_time = "ob_time"
        case country_code = "country_code"
        case clouds = "clouds"
        case ts = "ts"
        case solar_rad = "solar_rad"
        case state_code = "state_code"
        case city_name = "city_name"
        case wind_spd = "wind_spd"
        case last_ob_time = "last_ob_time"
        case wind_cdir_full = "wind_cdir_full"
        case wind_cdir = "wind_cdir"
        case slp = "slp"
        case vis = "vis"
        case h_angle = "h_angle"
        case sunset = "sunset"
        case dni = "dni"
        case dewpt = "dewpt"
        case snow = "snow"
        case uv = "uv"
        case precip = "precip"
        case wind_dir = "wind_dir"
        case sunrise = "sunrise"
        case ghi = "ghi"
        case dhi = "dhi"
        case aqi = "aqi"
        case lat = "lat"
        case weather = "weather"
        case datetime = "datetime"
        case temp = "temp"
        case station = "station"
        case elev_angle = "elev_angle"
        case app_temp = "app_temp"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        rh = try values.decodeIfPresent(Int.self, forKey: .rh)
        pod = try values.decodeIfPresent(String.self, forKey: .pod)
        lon = try values.decodeIfPresent(Double.self, forKey: .lon)
        pres = try values.decodeIfPresent(Double.self, forKey: .pres)
        timezone = try values.decodeIfPresent(String.self, forKey: .timezone)
        ob_time = try values.decodeIfPresent(String.self, forKey: .ob_time)
        country_code = try values.decodeIfPresent(String.self, forKey: .country_code)
        clouds = try values.decodeIfPresent(Int.self, forKey: .clouds)
        ts = try values.decodeIfPresent(Int.self, forKey: .ts)
        solar_rad = try values.decodeIfPresent(Double.self, forKey: .solar_rad)
        state_code = try values.decodeIfPresent(String.self, forKey: .state_code)
        city_name = try values.decodeIfPresent(String.self, forKey: .city_name)
        wind_spd = try values.decodeIfPresent(Double.self, forKey: .wind_spd)
        last_ob_time = try values.decodeIfPresent(String.self, forKey: .last_ob_time)
        wind_cdir_full = try values.decodeIfPresent(String.self, forKey: .wind_cdir_full)
        wind_cdir = try values.decodeIfPresent(String.self, forKey: .wind_cdir)
        slp = try values.decodeIfPresent(Int.self, forKey: .slp)
        vis = try values.decodeIfPresent(Int.self, forKey: .vis)
        h_angle = try values.decodeIfPresent(Int.self, forKey: .h_angle)
        sunset = try values.decodeIfPresent(String.self, forKey: .sunset)
        dni = try values.decodeIfPresent(Double.self, forKey: .dni)
        dewpt = try values.decodeIfPresent(Double.self, forKey: .dewpt)
        snow = try values.decodeIfPresent(Int.self, forKey: .snow)
        uv = try values.decodeIfPresent(Double.self, forKey: .uv)
        precip = try values.decodeIfPresent(Int.self, forKey: .precip)
        wind_dir = try values.decodeIfPresent(Int.self, forKey: .wind_dir)
        sunrise = try values.decodeIfPresent(String.self, forKey: .sunrise)
        ghi = try values.decodeIfPresent(Double.self, forKey: .ghi)
        dhi = try values.decodeIfPresent(Double.self, forKey: .dhi)
        aqi = try values.decodeIfPresent(Int.self, forKey: .aqi)
        lat = try values.decodeIfPresent(Double.self, forKey: .lat)
        weather = try values.decodeIfPresent(WBWeather.self, forKey: .weather)
        datetime = try values.decodeIfPresent(String.self, forKey: .datetime)
        temp = try values.decodeIfPresent(Int.self, forKey: .temp)
        station = try values.decodeIfPresent(String.self, forKey: .station)
        elev_angle = try values.decodeIfPresent(Double.self, forKey: .elev_angle)
        app_temp = try values.decodeIfPresent(Double.self, forKey: .app_temp)
    }
    
}
