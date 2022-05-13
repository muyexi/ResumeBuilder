import Foundation
import UIKit

class FieldCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var indexPath: IndexPath?
    
    func setup(title: String) {
        titleLabel.text = title
    }
}
