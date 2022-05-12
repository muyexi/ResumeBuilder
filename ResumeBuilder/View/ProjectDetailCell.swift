//
//  File.swift
//  ResumeBuilder
//
//  Created by muyexi on 2022/5/10.
//

import Foundation
import UIKit

class ProjectDetailCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var technologyLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    func setup(project: ProjectDetail) {
        nameLabel.text = project.name
        sizeLabel.text = project.teamSize?.description
        summaryLabel.text = project.summary
        technologyLabel.text = project.usedTechnologies
        roleLabel.text = project.role
    }
}
