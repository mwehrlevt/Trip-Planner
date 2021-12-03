//
//  BudgetViewController.swift
//  Trip Planner
//
//  Created by Scotti Day on 12/1/21.
//  Copyright © 2021 mwehrle. All rights reserved.
//

import Foundation
import UIKit

class BudgetViewController: UITableViewController {
    
    var expensesList: ExpensesList!
    
    @IBAction func addNewExpense(_ sender: UIBarButtonItem) {
        let newExpense = expensesList.createEmptyExpense()
        
        if let index = expensesList.allExpenses.firstIndex(of: newExpense) {
            let indexPath = IndexPath(row: index, section: 0)
            
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expensesList.allExpenses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExpenseCell", for: indexPath) as! ExpenseCell

                
        let expense = expensesList.allExpenses[indexPath.row]

        let valueString = NSMutableAttributedString(string: "$\(expense.amountSpent) ")
        
        cell.nameLabel.text = expense.id
        
        if expense.category != "" {
            cell.typeLabel.text = expense.category
        } else {
            cell.typeLabel.text = ""
        }
        
        if expense.amountSpent > 0 {
            cell.valueLabel.attributedText = valueString
        } else {
            cell.valueLabel.attributedText = NSMutableAttributedString(string: "")
        }

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showExpense":
            if let row = tableView.indexPathForSelectedRow?.row {
                let expense = expensesList.allExpenses[row]
                let detailViewController = segue.destination as! BudgetDetailViewController
                detailViewController.expense = expense
            }
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 65

    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let expense = expensesList.allExpenses[indexPath.row]

            let alertController = UIAlertController(title: nil, message: "Are you sure you want to remove \(expense.id)?", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            
            let removeAction = UIAlertAction(title: "Remove", style: .default) { _ in
                self.expensesList.removeExpense(expense)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            alertController.addAction(removeAction)
            
            present(alertController, animated: true, completion: nil)

        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        expensesList.moveExpense(from: sourceIndexPath.row, to: destinationIndexPath.row)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        navigationItem.leftBarButtonItem = editButtonItem
    }

}
