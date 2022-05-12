//
//  HomeViewController.swift
//  ResumeBuilder
//
//  Created by muyexi on 2022/5/11.
//

import Foundation
import UIKit

class HomeViewController: UITableViewController {
    @IBOutlet weak var titleLabel: UILabel!
    
    var resume: Resume? = Resume.read() {
        didSet {
            if resume != nil {
                titleLabel.text = "Edit Resume"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}
