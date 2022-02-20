//
//  ToDoController.swift
//  ToDO
//
//  Created by Qnarik Davtyan on 20.02.22.
//

import Foundation

class ToDoController {
    static let shared = ToDoController()
    private init() {}
    
    static let documentsDirectory = FileManager.default.urls(
        for: .documentDirectory, in: .userDomainMask).first!
    
    static let archiveURL =
documentsDirectory.appendingPathComponent("todos").appendingPathExtension("plist")
    
    static func loadToDos() -> [ToDo]? {
        guard let codedToDo = try? Data(contentsOf: archiveURL)
        else { return nil }
        
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode([ToDo].self, from: codedToDo)
    }
    
    static func saveToDos(_ todos: [ToDo]) {
        let propertyListEncoder = PropertyListEncoder()
        let codedToDos = try? propertyListEncoder.encode(todos)
        try? codedToDos?.write(to: archiveURL, options: .noFileProtection)
    }
    
    static func loadSampleToDos() -> [ToDo] {
        [
       ToDo(title: "ToDo One", isComplete: false, dueDate: Date(), notes: "Notes 1"),
       ToDo(title: "ToDo Two", isComplete: false, dueDate: Date(), notes: "Notes 2"),
       ToDo(title: "ToDo Three", isComplete: false, dueDate: Date(), notes: "Notes 3")
        ]
    }
    
    
    
    
}
