//
//  ToDoTableViewController.swift
//  TodoList
//
//  Created by Portia Wang on 6/23/17.
//  Copyright © 2017 Portia Wang. All rights reserved.
//

import UIKit

class ToDoTableViewController : UITableViewController {
    
    //MARK: - Properties
    var toDoList = [Task](){
        didSet{
            tableView.reloadData()
        }
    }
    
    
    //MARK: - functions
    
    override func prepare(for segue: UIStoryboardSegue, sender:Any?){
        if let identifier = segue.identifier{
            if identifier == "showDescription"{
                print("show description")
                
                let indexPath = tableView.indexPathForSelectedRow!
                let task = toDoList[indexPath.row]
                let displayTaskViewController = segue.destination as! DisplayTaskViewController
                displayTaskViewController.task = task
                
            }
                else if identifier == "addTask"{
                print("new task")
            }
        }
    }
    @IBAction func unwindToToDoTableVIewController (_ segue: UIStoryboardSegue)
    {
        self.toDoList = CoreDataHelper.getTasks()
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section : Int) -> Int {
        return toDoList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoCell", for: indexPath) as! ToDoListCell
        
        let row = indexPath.row
        let task = toDoList[row]
        cell.nameLabel.text = task.name
        cell.descriptionLabel.text = task.myDescription
        cell.dateCreatedLabel.text = task.dateCreated?.convertToString()
        
        
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toDoList = CoreDataHelper.getTasks()
    }

}
