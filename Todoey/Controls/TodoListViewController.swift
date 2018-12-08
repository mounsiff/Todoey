//
//  ViewController.swift
//  Todoey
//
//  Created by moncef bousria on 03/12/2018.
//  Copyright © 2018 moncef bousria. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController{

    var itemArray = [ModelItem]()
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("item.plist")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoadData()
        
        
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
        self.SaveData()
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    

    @IBAction func AddButtonPressed(_ sender: UIBarButtonItem) {
        let textfield = ModelItem()
        var text = UITextField()
        
        let alert = UIAlertController(title: "Add a TodoList", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Action", style: .default) { (Action) in
            textfield.title=text.text!
            print(text.text!)
            self.itemArray.append(textfield)
            self.SaveData()
        }
        alert.addAction(action)
        alert.addTextField { (AlerttextField) in
            
            AlerttextField.placeholder="Create New Item"
            text=AlerttextField
            
        }
    present(alert, animated: true, completion: nil)
    }
   //Mark - Save data
    func SaveData()
    {
        
        let encoder = PropertyListEncoder()
        do
        {
            let data = try encoder.encode(itemArray)
            try data.write(to: dataFilePath!)
        } catch {print(error)}
        
        tableView.reloadData()
    }
       //Mark - Load data
    func LoadData()
    {
        
        if let data = try? Data(contentsOf: dataFilePath!)
        {
                
            let decoder = PropertyListDecoder()
            do {
                itemArray = try decoder.decode([ModelItem].self, from: data)} catch {print(error)}
        }
        
        tableView.reloadData()
    }
   
}

