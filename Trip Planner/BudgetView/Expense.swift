//
//  Expense.swift
//  Trip Planner
//
//  Created by Scotti Day on 12/1/21.
//  Copyright © 2021 mwehrle. All rights reserved.
//


import Foundation
import UIKit

class Expense: Equatable {
    var category : String
    var id: String
    var amountSpent: Int
    let dateAdded: Date
    
    init(category: String, id: String, value: Int) {
        
        self.category = category
        self.id = id
        self.amountSpent = value
        self.dateAdded = Date()
    }
    
    static func ==(lhs: Expense, rhs: Expense) -> Bool {
        return lhs.category == rhs.category && lhs.id == rhs.id && lhs.amountSpent == rhs.amountSpent
    }
}
