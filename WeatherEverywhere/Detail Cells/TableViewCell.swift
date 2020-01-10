//
//  TableViewCell.swift
//  WeatherEverywhere
//
//  Created by Mohsen Moghimi on 8/12/19.
//  Copyright © 2019 Mohsen Moghimi. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var loc: UILabel!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var pressure: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var minTemp: UILabel!
    @IBOutlet weak var maxTemp: UILabel!
    @IBOutlet weak var windSpeed: UILabel!
    @IBOutlet weak var rain: UILabel!
    @IBOutlet weak var snow: UILabel!
    @IBOutlet weak var desc: UILabel!

    func config(object: OWList) {
        loc.text = "Location: \(object.name ?? "")"
        temp.text = "Temperature: \(object.main?.temp ?? 0.0) ℃"
        pressure.text = "Pressure: \(object.main?.pressure ?? 0)"
        humidity.text = "Humidity: \(object.main?.humidity ?? 0)"
        minTemp.text = "Temp-min: \(object.main?.temp_min ?? 0.0)"
        maxTemp.text = "Temp-max: \(object.main?.temp_max ?? 0.0)"
        windSpeed.text = "Wind speed: \(object.wind?.speed ?? 0.0)"
        desc.text = "Description: \(object.weather?[0].description ?? "")"
    }
    
}
