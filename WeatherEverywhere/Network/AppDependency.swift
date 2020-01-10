//
//  AppDependency.swift
//  WeatherEverywhere
//
//  Created by Mohsen Moghimi on 10/2/19.
//  Copyright © 2019 Mohsen Moghimi. All rights reserved.
//

import Foundation

protocol ServiceType {}

protocol HasClientService: ServiceType {
    var client: APIClientType { get }
}

protocol HasOpenWeatherService: ServiceType {
    var openWeather: OpenWeatherServiceType { get }
}

protocol HasWeatherBitService: ServiceType {
    var weatherBit: WeatherBitServiceType { get }
}

struct AppDependency: HasClientService, HasOpenWeatherService, HasWeatherBitService {
    let client: APIClientType
    let openWeather: OpenWeatherServiceType
    let weatherBit: WeatherBitServiceType
    
    init() {
        client = NewAPIClient()
        openWeather = OpenWeatherService(client)
        weatherBit = WeatherBitService(client)
    }
}
