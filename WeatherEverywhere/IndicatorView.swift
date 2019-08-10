//
//  IndicatorView.swift
//  WeatherEverywhere
//
//  Created by Mohsen Moghimi on 8/6/19.
//  Copyright © 2019 Mohsen Moghimi. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class IndicatorView: UIView {
    private var displayLink: CADisplayLink?
    private var startTime: CFAbsoluteTime?
    
    /// The `CAShapeLayer` that will contain the animated path
    
    private let shapeLayer: CAShapeLayer = {
        let _layer = CAShapeLayer()
        _layer.strokeColor = UIColor.red.cgColor
        _layer.fillColor = UIColor.clear.cgColor
        _layer.lineWidth = 1
        return _layer
    }()
    
    /// Start the display link
    
    func startDisplayLink() {
        self.layer.addSublayer(shapeLayer)
        startTime = CFAbsoluteTimeGetCurrent()
        displayLink?.invalidate()
        displayLink = CADisplayLink(target: self, selector:#selector(handleDisplayLink(_:)))
        displayLink?.add(to: RunLoop.current, forMode: .common)
    }
    
    /// Stop the display link
    
    func stopDisplayLink() {
        displayLink?.invalidate()
        displayLink = nil
    }
    
    /// Handle the display link timer.
    ///
    /// - Parameter displayLink: The display link.
    
    @objc func handleDisplayLink(_ displayLink: CADisplayLink) {
        let elapsed = CFAbsoluteTimeGetCurrent() - startTime!
        shapeLayer.path = wave(at: elapsed).cgPath
    }
    
    /// Create the wave at a given elapsed time.
    ///
    /// You should customize this as you see fit.
    ///
    /// - Parameter elapsed: How many seconds have elapsed.
    /// - Returns: The `UIBezierPath` for a particular point of time.
    
    private func wave(at elapsed: Double) -> UIBezierPath {
        let centerY = self.bounds.height / 2
        let amplitude = CGFloat(30) - abs(fmod(CGFloat(elapsed), 3) - 1.5) * 40
        
        func f(_ x: Int) -> CGFloat {
            return sin(((CGFloat(x) / self.bounds.width) + CGFloat(elapsed)) * 8 * .pi) * amplitude + centerY
        }
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: f(0)))
        for x in stride(from: 0, to: Int(self.bounds.width + 9), by: 10) {
            path.addLine(to: CGPoint(x: CGFloat(x), y: f(x)))
        }
        
        return path
    }
}
