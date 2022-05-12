//
//  ProjectDetailViewController.swift
//  ResumeBuilder
//
//  Created by muyexi on 2022/5/10.
//

import Foundation
import UIKit

class ProjectDetailViewController: BaseFormViewController<ProjectDetail> {
    override var titles: [String] {
        return ["Project Name", "Team Size", "Project Summary", "Technology used", "Role"]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Project Detail"
    }
    
    // MARK: - BaseFormProtocol
    override func didEdit(text: String, indexPath: IndexPath) {
        if indexPath.row == 0 {
            model.name = text
        } else if indexPath.row == 1 {
            if let num = Int(text) {
                model.teamSize = num
            } else {
                alert(title: "Wrong Team Size")
            }
        } else if indexPath.row == 2 {
            model.summary = text
        } else if indexPath.row == 3 {
            model.usedTechnologies = text
        } else if indexPath.row == 4 {
            model.role = text
        }
    }
}
