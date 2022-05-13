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
        
        DispatchQueue.global(qos: .background).async {
            self.resume = Resume.read() ?? Resume()

            DispatchQueue.main.async {
                self.updateState()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateState()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Resume", let controller = segue.destination as? ResumeViewController {
            controller.resume = resume
            controller.completion = { _ in
                if let resume = controller.resume, resume.validate().isValid {
                    self.resume = resume
                    self.updateState()
                }
            }
        }
    }
    
    // MARK: - Private
    func updateState() {
        if let resume = self.resume, resume.validate().isValid {
            self.titleLabel.text = "Edit Resume"
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Remove", style: .done, target: self, action: #selector(removeResume))
        } else {
            self.titleLabel.text = "Create Resume"
            navigationItem.rightBarButtonItem = nil
        }
    }
    
    @objc func removeResume() {
        Resume.clear()
        resume = Resume()
        
        updateState()
    }
}
