import Foundation
import UIKit

class AddItemCell: UITableViewCell {
    @IBOutlet weak var addButton: UIButton!
    
    func setup(title: String) {
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        addButton.setTitle(title, for: .normal)
    }
}
