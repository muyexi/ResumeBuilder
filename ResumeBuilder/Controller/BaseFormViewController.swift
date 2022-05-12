//
//  File.swift
//  ResumeBuilder
//
//  Created by muyexi on 2022/5/12.
//

import Foundation
import UIKit

protocol BaseFormProtocol {
    func didEdit(text: String, indexPath: IndexPath)
}

class BaseFormViewController<T: FormModelProtocol>: UITableViewController, UITextFieldDelegate, BaseFormProtocol {
    var titles: [String] {
        return []
    }
    
    var model: T = T()
    
    var completion: ((T) -> Void)?
    
    convenience init(completion: @escaping ((T) -> Void)) {
        self.init()
        
        self.completion = completion
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.allowsSelection = false
        tableView.separatorColor = .clear
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "DONE", style: .done, target: self, action: #selector(save))
    }
    
    // MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: FieldCell.identifier) as? FieldCell
        
        if cell == nil {
            cell = FieldCell.loadNib()
            cell?.textField.delegate = self
        }
        
        let title = titles[indexPath.row]
        cell?.setup(title: title)
        
        return cell!
    }
    
    // MARK: - UITextFieldDelegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let postion = textField.convert(textField.bounds.origin, to: tableView)

        guard let indexPath = tableView.indexPathForRow(at: postion) else {
            return true
        }
        
        if let text = textField.text, let range = Range(range, in: text) {
            let newText = text.replacingCharacters(in: range, with: string).trimmingCharacters(in: .whitespaces)
            
            if !newText.isEmpty {
                didEdit(text: newText, indexPath: indexPath)
            }
        }
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
        
    // MARK: - BaseFormProtocol
    func didEdit(text: String, indexPath: IndexPath) {
        
    }
    
    // MARK: - Private
    func alert(title: String, showDiscard: Bool = false) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Discard", style: .cancel) { action in
            self.dismiss(animated: true)
        }
        if showDiscard {
            alert.addAction(cancelAction)
        }
        
        let confirmAction = UIAlertAction(title: "Confirm", style: .default, handler: nil)
        alert.addAction(confirmAction)
        
        present(alert, animated: true)
    }
    
    @objc func save() {
        let result = model.validate()
        if result.isValid {
            dismiss(animated: true)
            self.completion?(self.model)
        } else {
            alert(title: result.msg ?? "Data is not valid!", showDiscard: true)
        }
    }
}

