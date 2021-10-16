//
//  ViewController.swift
//  Trip Planner
//
//  Created by Michelle on 10/14/21.
//  Copyright © 2021 mwehrle. All rights reserved.
// Trip planner

import UIKit

class ViewController: UIViewController {
    // where do you want to go? label
    @IBOutlet var placesToGoLabel: UILabel!
    @IBOutlet var burlingtonButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        //burlingtonButton.contentHorizontalAlignment = .fill
        //burlingtonButton.contentVerticalAlignment = .fill
        //burlingtonButton.imageView?.contentMode = .scaleAspectFill
        burlingtonButton.titleLabel?.textAlignment = .center
        //burlingtonButton.frame.size = CGSize(width:100, height:50)
        //burlingtonButton.setBackgroundImage(UIImage(named: "Burlington-Vermont.jpg"), for: .normal)
        //burlingtonButton.layer.cornerRadius = burlingtonButton.frame.size.height/2
        //burlingtonButton.clipsToBounds = true
        //burlingtonButton.contentMode = UIView.ContentMode.center
    }
    // Burlington button
    @IBAction func burlingtonButtonAction(_ sender: UIButton) {
        
    }
    
    // Boston button
    @IBAction func bostonButtonAction(_ sender: UIButton) {
        
    }
    
    // Chicago button
    @IBAction func chicagoButtonAction(_ sender: UIButton) {
        
    }
    
    // New York City button
    @IBAction func newYorkCityButtonAction(_ sender: UIButton) {
        
    }
    
    // Orlando button
    @IBAction func orlandoButtonAction(_ sender: UIButton) {
        
    }
}

