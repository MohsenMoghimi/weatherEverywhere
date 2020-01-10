//
//  AnimatedTableViewCell.swift
//  WeatherEverywhere
//
//  Created by Mohsen Moghimi on 10/9/19.
//  Copyright © 2019 Mohsen Moghimi. All rights reserved.
//

import UIKit
import SwiftyGif

class AnimatedTableViewCell: UITableViewCell {

    fileprivate var isArrowRotated = false
    @IBOutlet var animatedImage: UIImageView! {
        didSet {
            animatedImage.clipsToBounds = true
            
        }
    }
    @IBOutlet weak var arrow: UIImageView!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var status: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func config(model: OWList) {
        
        location.text = model.name
        guard let weather = model.weather else { return }
        status.text = weather[0].description
        animatedImage.image = UIImage(named: weather[0].icon!)
    }
    
    func rotateArrow() {
        if isArrowRotated {
            // Rotate 180
            UIView.animate(withDuration: 0.5, animations: {
                self.arrow.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi*2))
                self.isArrowRotated = false
            })
        } else {
            // Rotate 180
            UIView.animate(withDuration: 0.5, animations: {
                self.arrow.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
                self.isArrowRotated = true
            })
        }
    }
}

