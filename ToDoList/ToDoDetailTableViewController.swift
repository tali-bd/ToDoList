//
//  ToDoDetailTableViewController.swift
//  ToDoList
//
//  Created by Natalie Blando Demarco on 5/30/25.
//

import Foundation
import UIKit

class ToDoDetailTableViewController: UITableViewController{
    
    var isDateHidden = true
    
    let dateLabelIndexPath = IndexPath(row: 0, section: 1)
    let datePickerIndexPath = IndexPath(row: 1, section: 1)
    let notesTextViewIndexPath = IndexPath(row: 0, section: 2)

    let normalCellHeight: CGFloat = 44
    let largeCellHeight: CGFloat = 200
    
    var todo: ToDo?
    
    
    @IBOutlet var saveButton: UIBarButtonItem!
    
    
    @IBOutlet var cancelButton: UIBarButtonItem!
    
    
    @IBOutlet var checkMark: UIButton!
    
    
    @IBOutlet var textToDo: UITextField!
    
    @IBOutlet var dueDateLabel: UILabel!
    
    @IBOutlet var dueDatePicker: UIDatePicker!
    
    @IBOutlet var notes: UITextView!
    
    
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    @IBAction func returnPressed(_ sender: UITextField) {
        textToDo.resignFirstResponder()
    }
    

    @IBAction func checkMarkTapped(_ sender: UIButton) {
        checkMark.isSelected = !checkMark.isSelected
        
        print("Check")
    }
    
    
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        updateDueDateLabel(date: dueDatePicker.date)
    }
    
    func updateSaveButtonState()
    {
        let text = textToDo.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    
    func updateDueDateLabel(date: Date) {
        dueDateLabel.text = ToDo.dueDateFormatter.string(from: date)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case datePickerIndexPath:
            return isDateHidden ? 0 : dueDatePicker.frame.height
        case notesTextViewIndexPath:
            return largeCellHeight
        default:
            return normalCellHeight
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath == dateLabelIndexPath {
            isDateHidden = !isDateHidden
            dueDateLabel.textColor = isDateHidden ? .black : tableView.tintColor
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dueDatePicker.date = Date().addingTimeInterval(24*60*60)
        
        
        if let todo = todo {
            navigationItem.title = "To-Do"
            textToDo.text = todo.title
            checkMark.isSelected = todo.isComplete
            dueDatePicker.date = todo.dueDate
             notes.text = todo.notes
            } else {
              dueDatePicker.date = Date().addingTimeInterval(24*60*60)
            }


        updateDueDateLabel(date: dueDatePicker.date)
        updateSaveButtonState()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        guard segue.identifier == "saveUnwind" else { return }
            let title = textToDo.text!
            let isComplete = checkMark.isSelected
            let dueDate = dueDatePicker.date
            let notes = notes.text
            
            
            todo = ToDo(title: title, isComplete: isComplete, dueDate: dueDate, notes: notes)
        
    }


    
    
}
