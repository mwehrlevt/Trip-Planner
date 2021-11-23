//
//  ScheduleElement.swift
//  Trip Planner
//
//  Created by user201571 on 10/20/21.
//  Copyright © 2021 mwehrle. All rights reserved.
//

import Foundation
import UIKit

class ScheduleElement: Equatable, Codable {
    
    var name: String
    var city: String
    var date: Date
    var cost: String
    
    init(name: String, city: String, date: Date, cost: String) {
        self.name = name
        self.city = city
        self.date = date
        self.cost = cost
    }
    
    static func ==(lhs: ScheduleElement, rhs: ScheduleElement) -> Bool {
        return lhs.name == rhs.name && lhs.city == rhs.city && lhs.date == rhs.date && lhs.cost == rhs.cost
    }
    
}
