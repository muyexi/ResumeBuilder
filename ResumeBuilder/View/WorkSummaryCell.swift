import Foundation
import UIKit

class WorkSummaryCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    
    func setup(workSummary: WorkSummary) {
        titleLabel.text = workSummary.companyName
        durationLabel.text = workSummary.duration
    }
}
