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
    let eventArchiveURL: URL = {
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirerctory = documentsDirectories.first!
        return documentDirerctory.appendingPathComponent("events.plist")
    }()
    
    init() {
        do {
            print("Initializing Schedule")
            let data = try Data(contentsOf: eventArchiveURL)
            let unarchiver = PropertyListDecoder()
            let events = try unarchiver.decode([ScheduleElement].self, from: data)
            if(events.isEmpty){
                createEvent(name: "Placeholder",city: "City",date: Date.init(),cost: "$$$")
                print(events)
            } else {
                schedule = events
            }
            
        } catch {
            print("Error while reading in scheduled events: \(error)")
        }
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(saveChanges), name: UIScene.didEnterBackgroundNotification, object: nil)
    }
    
    @discardableResult func createEvent(name: String, city: String, date: Date, cost: String) -> ScheduleElement {
        let newEvent = ScheduleElement(name: name,city: city,date: date,cost: cost)
        
        schedule.append(newEvent)
        
        return newEvent
    }
    
    func removeEvent(_ event: ScheduleElement) {
        if let index = schedule.firstIndex(of: event) {
            schedule.remove(at: index)
        }
    }
    
    @objc func saveChanges() -> Bool {
        do{
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(schedule)
            try data.write(to: eventArchiveURL, options: [.atomic])
            print("Saved all scheduled events")
            return true
        } catch let encodingError {
            print("Error while encoding scheduled events: \(encodingError)")
            return false
        }
    }
}
