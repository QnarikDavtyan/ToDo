//
//  ToDo.swift
//  ToDO
//
//  Created by Qnarik Davtyan on 09.12.21.
//

import Foundation
import UIKit

struct ToDo: Codable {
    let id = UUID()
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    
}
    extension ToDo: Equatable {
        static func ==(lhs: Self, rhs: Self) -> Bool {
            return lhs.id == rhs.id
    }
}



