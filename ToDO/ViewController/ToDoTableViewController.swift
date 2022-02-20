//
//  ViewController.swift
//  ToDO
//
//  Created by Qnarik Davtyan on 09.12.21.
//

import UIKit

final class ToDoTableViewController: UITableViewController, ToDoCellDelegate {
    // MARK: - Model
    
    let todosController = ToDoController.shared
    var todos: [ToDo] = []
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let savedToDos = ToDoController.loadToDos() {
            todos = savedToDos
        } else {
            todos = ToDoController.loadSampleToDos()
        }
        tableView.reloadData()

        navigationItem.leftBarButtonItem = editButtonItem
    }

    // MARK: - DataSource

    override func tableView(
        _ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "ToDoCellIdentifier", for: indexPath) as? ToDoCell
        else { fatalError() }
        
        cell.populate(with: todos[indexPath.row])
        cell.delegate = self
        return cell
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath)
        -> Bool { true }
    
    override func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        if editingStyle == .delete {
            todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            ToDoController.saveToDos(todos)
        }
    }
    
    // MARK: - Segues

    @IBSegueAction func openEditSegue(_ coder: NSCoder, sender: Any?) -> ToDoDetailTableViewController? {
        if let cell = sender as? UITableViewCell,
           let indexPath = tableView.indexPath(for: cell) {
            let todo = todos[indexPath.row]
            tableView.deselectRow(at: indexPath, animated: true)
            return ToDoDetailTableViewController(coder: coder, todo: todo)
        } else {
            return ToDoDetailTableViewController(coder: coder)
        }
    }
    
    
    @IBAction func unwindToToDoList(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveUnwind"
            else { return }
        let sourceViewController = segue.source as! ToDoDetailTableViewController
        
        if let todo = sourceViewController.todo {
            if let indexOfExistingToDo = todos.firstIndex(of: todo) {
                todos[indexOfExistingToDo] = todo
                tableView.reloadRows(
                    at: [IndexPath(row: indexOfExistingToDo, section: 0)],
                    with: .automatic)
        } else {
            let newIndexPath = IndexPath(row: todos.count, section: 0)
            todos.append(todo)
            tableView.insertRows(at:[newIndexPath], with: .automatic)
        }
    }
        ToDoController.saveToDos(todos)
}
    
    func checkmarkTapped(sender: ToDoCell) {
        if let indexPath = tableView.indexPath(for: sender) {
            var todo = todos[indexPath.row]
            todo.isComplete.toggle()
            todos[indexPath.row] = todo
            tableView.reloadRows(at: [indexPath], with: .automatic)
            ToDoController.saveToDos(todos)
        }
    }
    }
