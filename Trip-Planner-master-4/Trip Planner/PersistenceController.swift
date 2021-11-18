//
//  PersistenceController.swift
//  Trip Planner
//
//  Created by Michelle on 11/14/21.
//  Copyright © 2021 mwehrle. All rights reserved.
//

import SwiftUI
import CoreData

struct PersistenceController {
    // used for entire app
    static let shared = PersistenceController()
    
    // storage for core data
    let container: NSPersistentContainer
    
    // initializer to load Core Data
    /*init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "ActivitesData")
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }*/
    
    init() {
        container = NSPersistentContainer(name: "ActivitesData")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Core Data Store Failed \(error.localizedDescription)")
            }
        }
    }
    
    func getAllActivities() -> [ActivitiesChosen] {
        let fetchRequest: NSFetchRequest<ActivitiesChosen> = ActivitiesChosen.fetchRequest()
        
        do {
            return try container.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
    // save data
    func save(activityName: String, city: String, date: Date, price: String) {
        let context = container.viewContext
        let activity = ActivitiesChosen(context: container.viewContext)
        activity.activityName = activityName
        activity.city = city
        activity.date = date
        activity.price = price
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Failed to save activity")
            }
        }
    }
}


// used to fix core data bug
public extension NSManagedObject {
    convenience init(context: NSManagedObjectContext) {
        let name = String(describing: type(of: self))
        let entity = NSEntityDescription.entity(forEntityName: name, in: context)!
        self.init(entity: entity, insertInto: context)
    }
}


