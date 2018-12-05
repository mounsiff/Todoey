//
//  ViewController.swift
//  Todoey
//
//  Created by moncef bousria on 03/12/2018.
//  Copyright © 2018 moncef bousria. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController{

    var itemArray = ["Task1","Task2","task3"]

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text=itemArray[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    

    @IBAction func AddButtonPressed(_ sender: UIBarButtonItem) {
        var textfield = UITextField()
        let alert = UIAlertController(title: "Add a TodoList", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Action", style: .default) { (Action) in
            self.itemArray.append(textfield.text!)
            self.tableView.reloadData()
        }
        alert.addAction(action)
        alert.addTextField { (AlerttextField) in
            
            AlerttextField.placeholder="Create New Item"
            textfield=AlerttextField
        }
    present(alert, animated: true, completion: nil)
    }
    
    
}

