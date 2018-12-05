//
//  ViewController.swift
//  Todoey
//
//  Created by moncef bousria on 03/12/2018.
//  Copyright © 2018 moncef bousria. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController{

    var itemArray = [ModelItem()]
    let defaut = UserDefaults.standard
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        if defaut.object(forKey: "toDoListClass") != nil {
            itemArray=defaut.object(forKey: "toDoListClass") as! [ModelItem]
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        if itemArray.count != 0{
        cell.textLabel?.text=itemArray[indexPath.row].title
        cell.accessoryType = itemArray[indexPath.row].done ? .checkmark : .none
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    

    @IBAction func AddButtonPressed(_ sender: UIBarButtonItem) {
        let textfield = ModelItem()
        
        let alert = UIAlertController(title: "Add a TodoList", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Action", style: .default) { (Action) in
            
            self.itemArray.append(textfield)
            self.defaut.set(self.itemArray, forKey: "toDoListClass")
            self.tableView.reloadData()
        }
        alert.addAction(action)
        alert.addTextField { (AlerttextField) in
            
            AlerttextField.placeholder="Create New Item"
            textfield.title=AlerttextField.text!
        }
    present(alert, animated: true, completion: nil)
    }
    
    
}

