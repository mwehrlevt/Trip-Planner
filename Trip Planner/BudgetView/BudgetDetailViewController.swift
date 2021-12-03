//
//  BudgetDetailViewController.swift
//  Trip Planner
//
//  Created by Scotti Day on 12/1/21.
//  Copyright © 2021 mwehrle. All rights reserved.
//

import UIKit

class BudgetDetailViewController: UIViewController, UITextFieldDelegate {
    
    var expensesList: ExpensesList!
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var typeField: UITextField!
    @IBOutlet var valueField: UITextField!
    @IBOutlet var dateLabel: UILabel!
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    var expense: Expense! {
        didSet {
            navigationItem.title = expense.id
        }
    }
    
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 0
        return formatter
    }()
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameField.text = expense.id
        typeField.text = expense.category
        valueField.text = numberFormatter.string(from: NSNumber(value: expense.amountSpent))
        dateLabel.text = dateFormatter.string(from: expense.dateAdded)
    }
    
    @IBAction func deleteExpense(_ sender: UIBarButtonItem) {
        
        let alertMessage = "Are you sure you want to delete \(expense.id)?"
        
        let alertController = UIAlertController(title: nil, message: alertMessage, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let removeAction = UIAlertAction(title: "Remove", style: .default) { _ in
            self.navigationController!.popViewController(animated: true)
        }
        alertController.addAction(removeAction)
        
        present(alertController, animated: true, completion: nil)
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Ckear first responder
        view.endEditing(true)
        
        expense.id = nameField.text ?? ""
        expense.category = typeField.text ?? ""
        
        if let valueText = valueField.text, let value = numberFormatter.number(from: valueText) {
            expense.amountSpent = value.intValue
        }
        else {
            expense.amountSpent = 0
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
