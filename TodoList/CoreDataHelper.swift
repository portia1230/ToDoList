//
//  CoreDataHelper.swift
//  TodoList
//
//  Created by Portia Wang on 6/23/17.
//  Copyright © 2017 Portia Wang. All rights reserved.
//

import CoreData
import UIKit

class CoreDataHelper {
    
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let persistentContainer = appDelegate.persistentContainer
    static let managedContext = persistentContainer.viewContext
    //static methods will go here
    
    static func newTask() -> Task{
        let task = NSEntityDescription.insertNewObject(forEntityName: "Task", into: managedContext) as! Task
        return task
    }
    
    static func saveTask(){
        do{
            try managedContext.save()
        } catch let error as NSError{
            print("Could not save\(error)")
        }
    }
    
    static func getTasks() ->[Task] {
        let fetchRequest = NSFetchRequest<Task>(entityName: "Task")
        do{
            let results = try managedContext.fetch(fetchRequest)
            return results
        } catch let error as NSError{
            print ("Could not fetch \(error)")
        }
        return []
    }
    
}
