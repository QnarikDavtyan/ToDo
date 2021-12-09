//
//  ToDo.swift
//  ToDO
//
//  Created by Qnarik Davtyan on 09.12.21.
//

import Foundation
import UIKit

struct ToDo: Equatable {
    let id = UUID()
    var title: String
    var isComplete: Bool
    var dueData: Data
    var notes: String?
    
    static func ==(lhs: ToDo, rhs: ToDo) -> Bool {
        return lhs.id == rhs.id
    }
    
    static func loadToDos() -> [ToDo]? {
        return nil
    }
    static func loadSampleToDos() -> [ToDo] {
        let todo1 = ToDo(title: "ToDo One", isComplete: false, dueData: Data(), notes: "Notes 1")
        let todo2 = ToDo(title: "ToDo Two", isComplete: false, dueData: Data(), notes: "Notes 2")
        let todo3 = ToDo(title: "ToDo Three", isComplete: false, dueData: Data(), notes: "Notes 3")
        
        return [todo1, todo2, todo3]
    }
}



