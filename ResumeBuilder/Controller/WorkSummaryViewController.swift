//
//  WorkSummaryViewController.swift
//  ResumeBuilder
//
//  Created by muyexi on 2022/5/10.
//

import Foundation
import UIKit


class WorkSummaryViewController: BaseFormViewController<WorkSummary> {
    override var titles: [String] {
        return ["Company Name", "Duration"]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Work Summary"
    }
    
    // MARK: - BaseFormProtocol
    override func didEdit(text: String, indexPath: IndexPath) {
        if indexPath.row == 0 {
            model.companyName = text
        } else if indexPath.row == 1 {
            model.duration = text
        }
    }
}
