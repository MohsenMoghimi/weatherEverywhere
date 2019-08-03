//
//  ViewController.swift
//  WeatherEverywhere
//
//  Created by Mohsen Moghimi on 8/3/19.
//  Copyright © 2019 Mohsen Moghimi. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var weatherMap: MKMapView!
    
    
    private let marker = MKPointAnnotation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(handleTap(gestureReconizer:)))
        gestureRecognizer.delegate = self
        weatherMap.addGestureRecognizer(gestureRecognizer)
        
    }
    
    @objc func handleTap(gestureReconizer: UILongPressGestureRecognizer) {
        let location = gestureReconizer.location(in: weatherMap)
        let coordinate = weatherMap.convert(location,toCoordinateFrom: weatherMap)
        // Add annotation:
        weatherMap.removeAnnotation(marker)
        marker.title = "\(coordinate.latitude) & \(coordinate.longitude)"
        marker.coordinate = coordinate
        weatherMap.addAnnotation(marker)
    }

    private func lockOnMarker(lock: Bool, on: CLLocationCoordinate2D){
        weatherMap.isZoomEnabled = !lock
        weatherMap.isScrollEnabled = !lock
        weatherMap.isUserInteractionEnabled = !lock
        let center = on
        weatherMap.setCenter(center, animated: true)
    }
    
    private func lockMapViewOnMarker(){
        
    }
}

