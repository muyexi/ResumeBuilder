//
//  File.swift
//  ResumeBuilder
//
//  Created by muyexi on 2022/5/12.
//

import Foundation
import UIKit

protocol BaseFormProtocol {
    func didEndEditing(text: String, indexPath: IndexPath)
}

class BaseFormViewController: UITableViewController, BaseFormProtocol {
    var titles: [String] {
        return []
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    // MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: FieldCell.identifier) as? FieldCell
        
        if cell == nil {
            cell = FieldCell.loadNib()
        }
        
        let title = titles[indexPath.row]
        cell?.setup(title: title)
        
        return cell!
    }
    
    // MARK: - UITextFieldDelegate
    func textFieldDidEndEditing(_ textField: UITextField) {
        let postion = textField.convert(textField.bounds.origin, to: tableView)

        guard let indexPath = tableView.indexPathForRow(at: postion) else {
            return
        }
        
        guard let text = textField.text, !text.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        
        didEndEditing(text: text, indexPath: indexPath)
    }
    
    // MARK: - BaseFormProtocol
    func didEndEditing(text: String, indexPath: IndexPath) {
        
    }
    
    // MARK: - Private
    func alertMissingData() {
        let alert = UIAlertController(title: "Data is missing!", message: nil, preferredStyle: .alert)
        alert.addTextField()
        
        let confirmAction = UIAlertAction(title: "Confirm", style: .default, handler: nil)
        alert.addAction(confirmAction)
        
        present(alert, animated: true)
    }
}

