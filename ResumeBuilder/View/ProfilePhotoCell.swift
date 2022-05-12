//
//  ProfilePhotoCell.swift
//  ResumeBuilder
//
//  Created by muyexi on 2022/5/10.
//

import Foundation
import UIKit

class ProfilePhotoCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var profileImageButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        titleLabel.text = "Profile Picture"
        
        profileImageButton.layer.cornerRadius = profileImageButton.frame.width / 2
        profileImageButton.layer.masksToBounds = true
    }
}
