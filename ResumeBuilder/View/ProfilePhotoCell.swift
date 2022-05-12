//
//  ProfilePhotoCell.swift
//  ResumeBuilder
//
//  Created by muyexi on 2022/5/10.
//

import Foundation
import UIKit

class ProfilePhotoCell: UITableViewCell {
    @IBOutlet weak var profileImageButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileImageButton.layer.cornerRadius = profileImageButton.frame.width / 2
        profileImageButton.layer.masksToBounds = true
    }
}
