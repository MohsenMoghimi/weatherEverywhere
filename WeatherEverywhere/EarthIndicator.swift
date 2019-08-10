//
//  EarthIndicator.swift
//  WeatherEverywhere
//
//  Created by Mohsen Moghimi on 8/7/19.
//  Copyright © 2019 Mohsen Moghimi. All rights reserved.
//

import Foundation
import UIKit

class EarthIndicator: UIView {
    
    let circleLayer = CAShapeLayer()
    var circlePath : UIBezierPath!
    
    override func draw(_ rect: CGRect) {
        drawCircle()
        
    }
    
    
    func drawCircle() {
        circlePath = UIBezierPath(arcCenter: CGPoint(x: self.bounds.width/2,y: self.bounds.height/2), radius: CGFloat(self.bounds.width/2), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        circleLayer.path = circlePath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeColor = UIColor.red.cgColor
        circleLayer.lineWidth = 3.0
        self.layer.addSublayer(circleLayer)
    }
    
}
