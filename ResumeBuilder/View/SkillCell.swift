//
//  File.swift
//  ResumeBuilder
//
//  Created by muyexi on 2022/5/10.
//

import Foundation
import UIKit

class SkillCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    func setup(skill: String) {
        nameLabel.text = skill
    }
}
