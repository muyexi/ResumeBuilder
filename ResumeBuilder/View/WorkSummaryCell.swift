//
//  WorkSummaryCell.swift
//  ResumeBuilder
//
//  Created by muyexi on 2022/5/10.
//

import Foundation
import UIKit

class WorkSummaryCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    func setup(workSummary: WorkSummary) {
        titleLabel.text = workSummary.companyName
        durationLabel.text = workSummary.duration
    }
}
