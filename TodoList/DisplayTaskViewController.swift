//
//  DisplayTaskViewController.swift
//  TodoList
//
//  Created by Portia Wang on 6/23/17.
//  Copyright © 2017 Portia Wang. All rights reserved.
//

import UIKit

class DisplayTaskViewController : UIViewController {
    
    var task : Task?
    
    @IBOutlet weak var taskTitleTextField: UITextField!
    @IBOutlet weak var taskDescriptionTextField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let task = task{
            taskTitleTextField.text = task.name
            taskDescriptionTextField.text = task.myDescription
        }else{
            
        taskTitleTextField.text = ""
        taskDescriptionTextField.text = ""
        }
        
    }
    
    override func prepare (for segue: UIStoryboardSegue, sender: Any?){
         if segue.identifier == "save"{
                let task = self.task ?? CoreDataHelper.newTask()
            task.name = taskTitleTextField.text ?? ""
            task.myDescription = taskDescriptionTextField.text ?? ""
            task.dateCreated = Date() as NSDate
            CoreDataHelper.saveTask()
        }
    }

    
}
