//
//  EventItemCell.swift
//  Trip Planner
//
//  Created by user201571 on 11/22/21.
//  Copyright © 2021 mwehrle. All rights reserved.
//

import UIKit

class EventItemCell: UITableViewCell {
    var event : ScheduleElement?{
        didSet {
            eventNameLabel.text = event?.name
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM d, h:mm a"
            eventDateLabel.text = dateFormatter.string(for: event?.date)
            
            eventCostLabel.text = event?.cost
        }
    }
    
    let eventNameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        return label
    }()
    
    let eventDateLabel : UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .left
        return label
    }()
    
    let eventCostLabel : UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .right
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(eventNameLabel)
        addSubview(eventDateLabel)
        addSubview(eventCostLabel)
        
        eventNameLabel.translatesAutoresizingMaskIntoConstraints = false
        let topName = eventNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8)
        let leadingName = eventNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8)
        
        topName.isActive = true
        leadingName.isActive = true
        
        eventDateLabel.translatesAutoresizingMaskIntoConstraints = false
        let dateTop = eventDateLabel.topAnchor.constraint(equalTo: eventNameLabel.bottomAnchor, constant: 8)
        let dateLeading = eventDateLabel.leadingAnchor.constraint(equalTo: eventNameLabel.leadingAnchor)
        
        dateTop.isActive = true
        dateLeading.isActive = true
        
        eventCostLabel.translatesAutoresizingMaskIntoConstraints = false
        let topCost = eventCostLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24)
        let trailingCost = eventCostLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        
        topCost.isActive = true
        trailingCost.isActive = true
    }
    
    required init?(coder aDecoder:NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
}
