//
//  EducationDetailViewController.swift
//  ResumeBuilder
//
//  Created by muyexi on 2022/5/10.
//

import Foundation
import UIKit

class EducationDetailViewController: BaseFormViewController {
    override var titles: [String] {
        return ["Class", "Passing year", "CGPA"]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Education Detail"
    }    
}
