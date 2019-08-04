//
//  LaunchscreenViewController.swift
//  WeatherEverywhere
//
//  Created by Mohsen Moghimi on 8/3/19.
//  Copyright © 2019 Mohsen Moghimi. All rights reserved.
//

import UIKit

class LaunchscreenViewController: UIViewController {

    @IBOutlet var container: UIView!
    @IBOutlet weak var firstCloud: UIImageView!
    @IBOutlet weak var sun: UIImageView!
    @IBOutlet weak var secondCloud: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondCloud.bringSubviewToFront(sun)
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        titleLabel.center.y -= view.bounds.height
        container.center.y -= view.bounds.height
        sun.center.y -= view.bounds.height
        firstCloud.center.x -= view.bounds.width
        secondCloud.center.x -= view.bounds.width
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.1) {
            self.container.center.y += self.view.bounds.height
        }
        
        UIView.animate(withDuration: 1, delay: 0.4, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: [], animations: {
            self.sun.center.y += self.view.bounds.height
        }, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 0.9, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: [], animations: {
            self.titleLabel.center.y += self.view.bounds.height
        }, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: [], animations: {
            self.firstCloud.center.x += self.view.bounds.width
        }, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 0.6, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: [], animations: {
            self.secondCloud.center.x += self.view.bounds.width
        }) { (true) in
            UIView.animate(withDuration: 1, delay: 0.4, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: [], animations: {
                self.sun.center.y -= self.view.bounds.height
            }, completion: nil)
            
            UIView.animate(withDuration: 1, delay: 0.9, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: [], animations: {
                self.titleLabel.center.y -= self.view.bounds.height
            }, completion: nil)
            
            UIView.animate(withDuration: 1, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: [], animations: {
                self.firstCloud.center.x -= self.view.bounds.width
            }, completion: nil)
            
            UIView.animate(withDuration: 1, delay: 0.6, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: [], animations: {
                self.secondCloud.center.x += self.view.bounds.width
            }) { (true) in
                self.performSegue(withIdentifier: "goToMap", sender: nil)
                UIView.animate(withDuration: 0.1) {
                    self.container.center.y -= self.view.bounds.height
                }
            }
        }
    }
}



