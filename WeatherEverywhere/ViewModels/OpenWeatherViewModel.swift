//
//  OpenWeatherViewModel.swift
//  WeatherEverywhere
//
//  Created by Mohsen Moghimi on 10/3/19.
//  Copyright © 2019 Mohsen Moghimi. All rights reserved.
//

import Foundation
import RxSwift

final class OpenWeatherViewModel: ViewModel<HasOpenWeatherService> {
    
    var openWeatherResponse : Observable<OWResponse> = .never()
    
    init(lat: Double, lon: Double) {
        super.init()
        openWeatherResponse = dependencies.openWeather.getWeatherFromOpenWeather(lat: lat, lon: lon).asObservable()
    }
}
