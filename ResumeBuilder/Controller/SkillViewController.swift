//
//  SkillViewController.swift
//  ResumeBuilder
//
//  Created by muyexi on 2022/5/11.
//

import Foundation
import UIKit

class SkillViewController: BaseFormViewController<Skill> {
    override var titles: [String] {
        return ["Skill"]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Skill"
    }
    
    // MARK: - BaseFormProtocol
    override func didEdit(text: String, indexPath: IndexPath) {
        if indexPath.row == 0 {
            model.name = text
        }
    }
}
