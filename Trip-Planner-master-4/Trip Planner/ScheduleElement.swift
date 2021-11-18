//
//  ScheduleElement.swift
//  Trip Planner
//
//  Created by user201571 on 10/20/21.
//  Copyright © 2021 mwehrle. All rights reserved.
//

import Foundation
import UIKit

class ScheduleElement {
    var date: Date
    var name: String
    var location: String
    
    init(name: String, date: Date, location: String) {
        self.name = name
        self.date = date
        self.location = location
    }
    
    convenience init(random: Bool = false) {
        if random {
            let randomNames = ["Burlington Farmers Market", "Ben and Jerry's Ice Cream", "Foam Brewers"]
            let randomLocations = ["Church Street", "Pearl Street", "Leddy Park"]
            
            let randomName = randomNames.randomElement()
            let date = Date()
            let randomLocation = randomLocations.randomElement()
            
            self.init(name: randomName!, date: date,location: randomLocation!)
        } else {
            self.init(name: "", date: Date(), location: "")
        }
    }
}
