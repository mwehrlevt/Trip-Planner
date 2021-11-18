//
//  Schedule.swift
//  Trip Planner
//
//  Created by user201571 on 10/20/21.
//  Copyright © 2021 mwehrle. All rights reserved.
//

import Foundation
import UIKit

class Schedule {
    
    var schedule = [ScheduleElement]()
    
    init() {
        for _ in 0...4 {
            createEvent()
        }
    }
    
    @discardableResult func createEvent() -> ScheduleElement {
        let newEvent = ScheduleElement(random: true)
        
        schedule.append(newEvent)
        
        return newEvent
    }
    
}
