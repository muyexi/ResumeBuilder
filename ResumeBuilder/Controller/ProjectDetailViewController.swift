//
//  ProjectDetailViewController.swift
//  ResumeBuilder
//
//  Created by muyexi on 2022/5/10.
//

import Foundation
import UIKit

class ProjectDetailViewController: BaseFormViewController {
    override var titles: [String] {
        return ["Project Name", "Team Size", "Project Summary", "Technology used", "Role"]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Project Detail"
    }    
}
