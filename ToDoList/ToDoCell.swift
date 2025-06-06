//
//  ToDoCell.swift
//  ToDoList
//
//  Created by Natalie Blando Demarco on 6/6/25.
//

import UIKit

class ToDoCell: UITableViewCell {

    
    
    
    @IBOutlet var checkMark: UIButton!
    
    
    @IBOutlet var textToDo: UITextField!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
