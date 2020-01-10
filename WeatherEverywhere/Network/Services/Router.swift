//
//  Router.swift
//  WeatherEverywhere
//
//  Created by Mohsen Moghimi on 10/2/19.
//  Copyright © 2019 Mohsen Moghimi. All rights reserved.
//

import Foundation

enum Router {
    
    case openWeather(lat: Double, lon: Double)
    case weatherBit(lat: Double, lon: Double)
}

extension Router: URLRequestConvertible {
    
    var url : URL {
        switch self {
        case .openWeather:
            return URL(string: "http://api.openweathermap.org/data/2.5/find?")!
        case .weatherBit:
            return URL(string: "https://api.weatherbit.io/v2.0/current?")!
        }
    }
    
    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    

    
    var parameters: [String : String] {
        switch self {
        case .openWeather(let lat, let lon):
            return [
                "lat" : "\(lat)",
                "lon" : "\(lon)",
                "units" : "metric",
                "APPID" : "dba52f70b805d00e270ab2a941f232fc"
            ]
        case .weatherBit(let lat, let lon):
            return [
                "lat" : "\(lat)",
                "lon" : "\(lon)",
                "KEY" : "d5bf1dbb909e46e7b6faae1411ede85f"
            ]
        }
    }
    
    var bodyData: Data? {
        return nil
    }
    
    func request() -> URLRequest {
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            fatalError("Unable to create URL components")
        }
        
        if !parameters.isEmpty {
            components.queryItems = parameters.map {
                URLQueryItem(name: String($0), value: String($1))
            }
        }
        
        guard let url = components.url else {
            fatalError("Could not get url")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = bodyData
//        request.addValue("application/javascript", forHTTPHeaderField: "content-type")
//        request.setValue("Basic \(base64Credentials)", forHTTPHeaderField: "Authorization")
        
        return request
    }
}
