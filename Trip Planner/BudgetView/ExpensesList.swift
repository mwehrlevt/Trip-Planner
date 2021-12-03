//
//  ExpensesList.swift
//  Trip Planner
//
//  Created by Scotti Day on 12/1/21.
//  Copyright © 2021 mwehrle. All rights reserved.
//

import Foundation
import UIKit

class ExpensesList {
    var allExpenses = [Expense]()
    
    @discardableResult func createEmptyExpense() -> Expense {
        let newExpense = Expense(category: "", id: "New Expense", value: 0)
        
        allExpenses.append(newExpense)
        
        return newExpense
    }
    
    func removeExpense(_ expense: Expense) {
        if let index = allExpenses.firstIndex(of: expense) {
            allExpenses.remove(at: index)
        }
    }
    
    func moveExpense(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        let movedExpense = allExpenses[fromIndex]
        allExpenses.remove(at: fromIndex)
        allExpenses.insert(movedExpense, at: toIndex)
    }
    
}
