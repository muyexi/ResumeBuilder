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
    
    var resume: Resume?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        resume = Resume.read() ?? Resume()
        
        if let resume = resume, resume.validate().isValid {
            titleLabel.text = "Edit Resume"
        }
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Resume", let controller = segue.destination as? ResumeViewController {
            controller.resume = resume
            controller.completion = { _ in
                if let resume = controller.resume, resume.validate().isValid {
                    self.resume = resume
                    self.tableView.reloadData()
                }
            }
        }
    }
}
