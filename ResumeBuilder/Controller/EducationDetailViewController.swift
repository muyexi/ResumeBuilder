import Foundation
import UIKit

class EducationDetailViewController: BaseFormViewController<EducationDetail> {
    override var titles: [String] {
        return ["Class", "Passing year", "CGPA"]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Education Detail"
    }
    
    // MARK: - BaseFormProtocol
    override func didEditTextField(text: String, indexPath: IndexPath) {
        if indexPath.row == 0 {
            model.educationClass = text
        } else if indexPath.row == 1 {
            model.passingYear = text
        } else if (indexPath.row == 2) {
            model.cgpa = text
        }
    }
}
