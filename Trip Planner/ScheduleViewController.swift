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
    
    var myTableView : UITableView!
    let cellId = "EventItemCell"
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schedule.schedule.count
    }
    
    func addNewEvent(newEvent: ScheduleElement) {
        
        // figure out where that item is in the array
        if let index = schedule.schedule.firstIndex(of: newEvent) {
            let indexPath = IndexPath(row: index, section: 0)
            
            // insert into new row in table
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! EventItemCell
                
        let event = schedule.schedule[indexPath.row]
        
        print(event.name)
        
        cell.event = event
        
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
        
        tableView.register(EventItemCell.self, forCellReuseIdentifier: cellId)
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 65
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        myTableView = UITableView()

        myTableView.dataSource = self
        myTableView.delegate = self
        
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(myTableView)
        
        let tableTop = myTableView.topAnchor.constraint(equalTo: view.topAnchor)
        let tableBottom = myTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        let tableLeft = myTableView.leftAnchor.constraint(equalTo: view.leftAnchor)
        let tableRight = myTableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        
        tableTop.isActive = true
        tableBottom.isActive = true
        tableLeft.isActive = true
        tableRight.isActive = true
        
        tableView.reloadData()
        
    }
    
}
