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
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "ActivitesData")
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
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
    func save(activityName: String) {
        let context = container.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Failed to save activity")
            }
        }
    }
}


