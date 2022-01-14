//
//  ToDoDetailTableViewController.swift
//  ToDO
//
//  Created by Qnarik Davtyan on 16.12.21.
//

import UIKit

class ToDoDetailTableViewController: UITableViewController {
    
    var isDatePickerHidden = true
    let dateLabelIndexPath = IndexPath(row: 0, section: 1)
    let datePikerIndexPath = IndexPath(row: 1, section: 1)
    let notesIndexPath = IndexPath(row: 0, section: 2)

    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var isCompleteButton: UIButton!
    @IBOutlet var dueDateLabel: UILabel!
    @IBOutlet var dueDatePickerView: UIDatePicker!
    @IBOutlet var notesTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDueDateLabel(date: dueDatePickerView.date)
        dueDatePickerView.date = Date().addingTimeInterval(24*60*60)
        updateSaveButtonState()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case datePikerIndexPath where isDatePickerHidden == true:
            return 0
        case notesIndexPath:
            return 200
        default:
            return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath == dateLabelIndexPath {
            isDatePickerHidden.toggle()
            dueDateLabel.textColor = .black
            updateDueDateLabel(date: dueDatePickerView.date)
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }

    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    func updateSaveButtonState() {
        let shouldEnableSaveButton = titleTextField.text?.isEmpty == false
        saveButton.isEnabled = shouldEnableSaveButton
    }
    
    @IBAction func textEditingChanged(_ sender: Any) {
        updateSaveButtonState()
    }
    
    @IBAction func returnPressed(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func isCompleteButtonTapped(_ sender: UIButton) {
        isCompleteButton.isSelected.toggle()
    }
        
    func updateDueDateLabel(date: Date) {
        dueDateLabel.text = ToDo.dueDateFormatter.string(from: date)
    }
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        updateDueDateLabel(date: sender.date)
    }
}
