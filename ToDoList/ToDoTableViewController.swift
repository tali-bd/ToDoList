//
//  ToDoTableViewController.swift
//  ToDoList
//
//  Created by Natalie Blando Demarco on 5/30/25.
//

// Will display list in table and control the ToDo items

import UIKit

class ToDoTableViewController: UITableViewController {
    
    var todos = [ToDo]()

    
    @IBAction func unwindToToDoList(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveUnwind" else { return }
            let sourceViewController = segue.source as! ToDoDetailTableViewController

        if let todo = sourceViewController.todo {
                if let selectedIndexPath = tableView.indexPathForSelectedRow {
                    todos[selectedIndexPath.row] = todo
                    tableView.reloadRows(at: [selectedIndexPath], with: .none)
                } else {
                    let newIndexPath = IndexPath(row: todos.count, section: 0)
                    todos.append(todo)
                    tableView.insertRows(at: [newIndexPath], with: .automatic)
                }
            }
                
            //let newIndexPath = IndexPath(row: todos.count, section: 0)

                //todos.append(todo)
                //tableView.insertRows(at: [newIndexPath], with: .automatic)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        print("In prepare for editToDo")
        print("\(String(describing: segue.identifier))")
        print("\(segue.identifier == "EditToDo")")
        
        if segue.identifier == "EditToDo",
            let navController = segue.destination as? UINavigationController,
            let todoDetailTableViewController = navController.topViewController as? ToDoDetailTableViewController {
            let indexPath = tableView.indexPathForSelectedRow!
            let selectedToDo = todos[indexPath.row]
            
            todoDetailTableViewController.todo = selectedToDo
            
            print("\(indexPath)")
            print("\(selectedToDo)")
            
            print("Done with EditToDo prepare for")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let savedToDos = ToDo.loadToDos() {
            todos = savedToDos
        } else {
            todos = ToDo.loadSampleToDos()
        }
        
        navigationItem.leftBarButtonItem = editButtonItem

    }
    
    // Creates same number of rows as items in the todo list array (todos)
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    
    //Dequeues a cell, grabs corresponding model, update cell's properties
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*let oldCell = tableView.dequeueReusableCell(withIdentifier: "ToDoCellIdentifier", for: indexPath)
        
        print("oldCell: \(String(describing: oldCell))")*/
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCellIdentifier") as? ToDoCell else {
            fatalError("Could not dequeue a cell")
            }

        let todo = todos[indexPath.row]
        cell.textToDo?.text = todo.title
        //cell.checkMark.isSelected = todo.isComplete
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

    

    
    
}
