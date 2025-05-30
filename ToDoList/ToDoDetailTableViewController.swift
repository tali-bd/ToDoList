//
//  ToDoDetailTableViewController.swift
//  ToDoList
//
//  Created by Natalie Blando Demarco on 5/30/25.
//

import Foundation
import UIKit

class ToDoDetailTableViewController: UITableViewController{
    
    @IBOutlet var checkMark: UIButton!
    
    @IBOutlet var taskName: UITextField!
    
    @IBOutlet var dueDateLabel: UILabel!
    
    @IBOutlet var dueDatePicker: UIDatePicker!
    
    @IBOutlet var notes: UITextView!

    @IBOutlet var saveButton: UIBarButtonItem!
    @IBOutlet var cancelButton: UIBarButtonItem!
    
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    @IBAction func returnPressed(_ sender: UITextField) {
        taskName.resignFirstResponder()
    }
    
    
    @IBAction func checkMarkTapped(_ sender: UIButton) {
        checkMark.isSelected = !checkMark.isSelected
    }
    
    func updateSaveButtonState() {
        let text = taskName.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateSaveButtonState()
    }
    

}
