//
//  ScheduleViewController.swift
//  Trip Planner
//
//  Created by user201571 on 10/20/21.
//  Copyright © 2021 mwehrle. All rights reserved.
//

import Foundation
import UIKit

class ScheduleViewController: UITableViewController {
    
    var schedule: Schedule!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schedule.schedule.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventItemCell", for: indexPath) as! EventItemCell
        
        // Set the text on the cell
        let event = schedule.schedule[indexPath.row]
        
        // configure the cell with the item
        cell.name.text = event.name
        cell.city.text = event.city
        cell.date.text = event.date.description
        cell.cost.text = event.cost
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // if the table view is asking to commit a delete
        if editingStyle == .delete {
            let event = schedule.schedule[indexPath.row]
            
            // remove the plant
            schedule.removeEvent(event)
            
            // remove that row from the table view with an animation
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 65
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
}
