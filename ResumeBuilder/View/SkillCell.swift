import Foundation
import UIKit

class SkillCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
        
    func setup(skill: String) {
        nameLabel.text = skill
    }
}
