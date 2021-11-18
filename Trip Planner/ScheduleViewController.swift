//
//  ScheduleViewController.swift
//  Trip Planner
//
//  Created by user201571 on 10/20/21.
//  Copyright © 2021 mwehrle. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ScheduleViewController: UITableViewController {
    
    var schedule: Schedule!
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schedule.schedule.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Creating an instance of UITable with default appearance
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
        
        //Set the text on the cell with the description of the item
        // that is at the nth index of items, where n = row this cell
        // will appear in on the table view
        
        let scheduleEvent = schedule.schedule[indexPath.row]
        
        cell.textLabel?.text = scheduleEvent.name
        cell.detailTextLabel?.text = scheduleEvent.location
        
        return cell
    }
}
