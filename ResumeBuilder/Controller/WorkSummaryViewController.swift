//
//  WorkSummaryViewController.swift
//  ResumeBuilder
//
//  Created by muyexi on 2022/5/10.
//

import Foundation
import UIKit


class WorkSummaryViewController: BaseFormViewController {
    var summary: WorkSummary = WorkSummary()
    
    override var titles: [String] {
        return ["Company Name", "Duration"]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Work Summary"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    // MARK: - BaseFormProtocol
    override func didEndEditing(text: String, indexPath: IndexPath) {
        if indexPath.section == 1 {
            if indexPath.row == 0 {
                summary.companyName = text
            } else if indexPath.row == 1 {
                summary.duration = text
            }
        }
    }
    
    // MARK: - Private
    func save() {
        if summary.isValid() {
            dismiss(animated: true)
        } else {
            alertMissingData()
        }
    }
}
