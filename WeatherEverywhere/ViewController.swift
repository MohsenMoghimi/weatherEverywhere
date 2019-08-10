//
//  ViewController.swift
//  WeatherEverywhere
//
//  Created by Mohsen Moghimi on 8/3/19.
//  Copyright © 2019 Mohsen Moghimi. All rights reserved.
//

import UIKit
import MapKit
import Alamofire

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var detailsBtn: UIButton!
    @IBOutlet weak var weatherMap: MKMapView!
    
    private var latitude : Double = 0.0
    private var longitude : Double = 0.0
    private var isMarkerDropped = false
    private let marker = MKPointAnnotation()
    let config = URLSessionConfiguration.default
    let jsonDecoder = JSONDecoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cancelBtn.center.x -= cancelBtn.frame.width
        detailsBtn.center.x += detailsBtn.frame.width
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        clearMarker()
    }
    
    @IBAction func details(_ sender: UIButton) {
        if (latitude != 0.0) && (longitude != 0.0) {
            getWeatherInfo(lat: latitude, lon: longitude)
        }
    }
    
    private func setupViews() {
        
        cancelBtn.center.x -= cancelBtn.frame.width
        detailsBtn.center.x += detailsBtn.frame.width
        let gestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(handleTap(gestureReconizer:)))
        gestureRecognizer.delegate = self
        weatherMap.addGestureRecognizer(gestureRecognizer)
        cancelBtn.layer.cornerRadius = 20
        detailsBtn.layer.cornerRadius = 20
        
    }
    
    @objc func handleTap(gestureReconizer: UILongPressGestureRecognizer) {
        let location = gestureReconizer.location(in: weatherMap)
        let coordinate = weatherMap.convert(location,toCoordinateFrom: weatherMap)
        // Add annotation:
        weatherMap.removeAnnotation(marker)
        marker.title = "\(coordinate.latitude) & \(coordinate.longitude)"
        latitude = coordinate.latitude
        longitude = coordinate.longitude
        marker.coordinate = coordinate
        weatherMap.addAnnotation(marker)
        if isMarkerDropped {
            return
        } else {
            UIView.animate(withDuration: 0.8, delay: 0,
                           usingSpringWithDamping: 1,
                           initialSpringVelocity: 1,
                           options: .curveEaseOut,
                           animations: {
                            self.cancelBtn.center.x += (self.cancelBtn.frame.width - 15)
                            self.detailsBtn.center.x -= (self.detailsBtn.frame.width - 15)
            }, completion: nil)
            isMarkerDropped = true
            
        }
    }
    
    private func clearMarker() {
        weatherMap.removeAnnotation(marker)
        UIView.animate(withDuration: 0.8, delay: 0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 1,
                       options: .curveEaseOut,
                       animations: {
                        self.cancelBtn.center.x -= (self.cancelBtn.frame.width - 15)
                        self.detailsBtn.center.x += (self.detailsBtn.frame.width - 15)
        }, completion: nil)
        isMarkerDropped = false
    }
    
    private func getWeatherInfo(lat: Double, lon: Double){
        
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/find?lat=\(lat)&lon=\(lon)&APPID=dba52f70b805d00e270ab2a941f232fc") else {
            return
        }
        let session = URLSession(configuration: config)
        var urlRequest = URLRequest(url: url,
                                    cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                    timeoutInterval: 10.0 * 1000)
        urlRequest.httpMethod = "GET"
        let task = session.dataTask(with: url) { data, response, error in
            guard error == nil else {
                print ("error: \(error!)")
                return
            }
            guard let content = data else {
                print("No data")
                return
            }
            guard let json = (try? JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [String: Any] else {
                print("Not containing JSON")
                return
            }
            do {
                let responseModel = try self.jsonDecoder.decode(Response.self, from: data!)
                print(responseModel)
            } catch {
                print("model not worked")
            }
            print("gotten json response dictionary is \n \(json)")
            
        }
        task.resume()
    }
}

