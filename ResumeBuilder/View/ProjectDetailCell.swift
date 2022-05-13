import Foundation
import UIKit

class ProjectDetailCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var technologyLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    
    func setup(project: ProjectDetail) {
        nameLabel.text = project.name
        sizeLabel.text = project.teamSize?.description
        summaryLabel.text = project.summary
        technologyLabel.text = project.usedTechnologies
        roleLabel.text = project.role
    }
}
