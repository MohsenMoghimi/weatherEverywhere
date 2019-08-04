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

    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var detailsBtn: UIButton!
    @IBOutlet weak var weatherMap: MKMapView!
    
    private var isMarkerDropped = false
    private let marker = MKPointAnnotation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cancelBtn.center.x -= cancelBtn.frame.width
        detailsBtn.center.x += detailsBtn.frame.width
        let gestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(handleTap(gestureReconizer:)))
        gestureRecognizer.delegate = self
        weatherMap.addGestureRecognizer(gestureRecognizer)
        cancelBtn.layer.cornerRadius = 15
        detailsBtn.layer.cornerRadius = 15
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cancelBtn.center.x -= cancelBtn.frame.width
        detailsBtn.center.x += detailsBtn.frame.width
    }
    @IBAction func cancel(_ sender: UIButton) {
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
    @IBAction func details(_ sender: UIButton) {
    }
    
    @objc func handleTap(gestureReconizer: UILongPressGestureRecognizer) {
        let location = gestureReconizer.location(in: weatherMap)
        let coordinate = weatherMap.convert(location,toCoordinateFrom: weatherMap)
        // Add annotation:
        weatherMap.removeAnnotation(marker)
        marker.title = "\(coordinate.latitude) & \(coordinate.longitude)"
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
}

