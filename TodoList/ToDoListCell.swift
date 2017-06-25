//
//  ToDoListCell.swift
//  TodoList
//
//  Created by Portia Wang on 6/23/17.
//  Copyright © 2017 Portia Wang. All rights reserved.
//

import UIKit

class ToDoListCell : UITableViewCell {
    
    
    //Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateCreatedLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var markColorButton: UIButton!
    
    
    
    //functions
    @IBAction func markButtonTapped(_ sender: Any) {
        if markColorButton.currentTitle == "incomplete" {
        markColorButton.setTitleColor(UIColor.green, for: .normal)
           markColorButton.setTitle("done", for: .normal)
            
        }else{
            markColorButton.setTitleColor(UIColor.red, for: .normal)
            markColorButton.setTitle("incomplete", for: .normal)
        }
        
    }
}
