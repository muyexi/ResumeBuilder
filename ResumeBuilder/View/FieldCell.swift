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
}
