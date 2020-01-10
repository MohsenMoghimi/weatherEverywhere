//
//  WeatherBitService.swift
//  WeatherEverywhere
//
//  Created by Mohsen Moghimi on 10/3/19.
//  Copyright © 2019 Mohsen Moghimi. All rights reserved.
//

import Foundation
import RxSwift

protocol WeatherBitServiceType {
    func getWeatherFromWeatherBit(lat: Double, lon: Double) -> Single<OWResponse>
}

struct WeatherBitService : WeatherBitServiceType {
    
    func getWeatherFromWeatherBit(lat: Double, lon: Double) -> Single<OWResponse> {
        return client.request(Router.weatherBit(lat: lat, lon: lon))
    }
    
    let client: APIClientType
    
    init(_ client: APIClientType) {
        self.client = client
    }
}
