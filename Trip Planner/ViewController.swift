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
        burlingtonButton.titleLabel?.textAlignment = .center
    }
    // Burlington button
    @IBAction func burlingtonButtonAction(_ sender: UIButton) {
        print("Burlington")
    }
    
    // Boston button
    @IBAction func bostonButtonAction(_ sender: UIButton) {
        print("Boston")
    }
    
    // Chicago button
    @IBAction func chicagoButtonAction(_ sender: UIButton) {
        print("Chicago")
    }
    
    // New York City button
    @IBAction func newYorkCityButtonAction(_ sender: UIButton) {
        print("New York City")
    }
    
    // Orlando button
    @IBAction func orlandoButtonAction(_ sender: UIButton) {
        print("Orlando")
    }
}

