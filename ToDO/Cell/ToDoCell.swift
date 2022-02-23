//
//  ToDoCell.swift
//  ToDO
//
//  Created by Qnarik Davtyan on 20.01.22.
//

import UIKit

protocol ToDoCellDelegate: AnyObject {
    func checkmarkTapped(sender: ToDoCell)
}

class ToDoCell: UITableViewCell {
    
    // MARK: - Delegation
    
    weak var delegate: ToDoCellDelegate?
    
    // MARK: - Outlet

    @IBOutlet var isCompleteButton: UIButton!
    @IBOutlet var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func completeButtonTapped(_ sender: UIButton) {
        delegate?.checkmarkTapped(sender: self)
    }
    
    // MARK: - Injection
    
    func populate(with todo: ToDo) {
        titleLabel.text = todo.title
        isCompleteButton.isSelected = todo.isComplete
    }
}
