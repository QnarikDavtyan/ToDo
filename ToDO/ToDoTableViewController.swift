//
//  ViewController.swift
//  ToDO
//
//  Created by Qnarik Davtyan on 09.12.21.
//

import UIKit

class ToDoTableViewController: UITableViewController {

    var todos = [ToDo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        if let savedToDos = ToDo.loadToDos() {
            todos = savedToDos
        } else {
            todos = ToDo.loadSampleToDos()
        }
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCellIdentifier", for: indexPath)

        let todo = todos[indexPath.row]
        cell.textLabel?.text = todo.title
        return cell
    }

}

