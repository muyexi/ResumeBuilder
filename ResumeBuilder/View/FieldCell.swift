//
//  FieldCell.swift
//  ResumeBuilder
//
//  Created by muyexi on 2022/5/10.
//

import Foundation
import UIKit

class FieldCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var indexPath: IndexPath?
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    func setup(title: String) {
        titleLabel.text = title
    }

    
    // MARK: - UITextFieldDelegate
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text, !text.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        
        if indexPath?.section == 1 {
            if indexPath?.row == 0 {
                Resume.shared.mobileNumber = text
            } else if indexPath?.row == 1 {
                Resume.shared.emailAddress = text
            } else if indexPath?.row == 2 {
                Resume.shared.residenceAddress = text
            } else if indexPath?.row == 3 {
                Resume.shared.careerObjective = text
            } else if indexPath?.row == 4, let num = Int(text) {
                Resume.shared.yearsOfExperience = num
            }
        }
    }
}
