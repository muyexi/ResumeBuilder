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
