import Foundation
import UIKit

class EducationDetailCell: UITableViewCell {
    
    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var gradeLabel: UILabel!
    
    func setup(education: EducationDetail) {
        classLabel.text = education.educationClass
        yearLabel.text = education.passingYear
        gradeLabel.text = education.cgpa
    }
}
