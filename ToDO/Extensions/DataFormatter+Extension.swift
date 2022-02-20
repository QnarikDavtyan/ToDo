//
//  DataFormatter+Extension.swift
//  ToDO
//
//  Created by Qnarik Davtyan on 20.02.22.
//

import Foundation

extension DateFormatter {
    static let dueDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
}
