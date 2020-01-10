//
//  OpenWeatherService.swift
//  WeatherEverywhere
//
//  Created by Mohsen Moghimi on 10/2/19.
//  Copyright © 2019 Mohsen Moghimi. All rights reserved.
//

import Foundation
import RxSwift

protocol OpenWeatherServiceType {
    func getWeatherFromOpenWeather(lat: Double, lon: Double) -> Single<OWResponse>
}

struct OpenWeatherService : OpenWeatherServiceType {
    func getWeatherFromOpenWeather(lat: Double, lon: Double) -> Single<OWResponse> {
        return client.request(Router.openWeather(lat: lat, lon: lon))
    }
    
    let client: APIClientType
    
    init(_ client: APIClientType) {
        self.client = client
    }
    
}
