//
//  ViewController.swift
//  ResumeBuilder
//
//  Created by muyexi on 2022/5/10.
//

import UIKit

class ResumeViewController: UITableViewController, UITextFieldDelegate {
    
    var resume: Resume?
    
    let titles = ["Mobile number", "Email Address", "Residence Address", "Career Objective", "Total Years of experience"]
    let sectionTitles = [
        ["Mobile number", "Email Address", "Residence Address", "Career Objective", "Total Years of experience"],
        
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
//        tableView.style = .grouped
    }
    
    // MARK: - UITableViewDataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return titles.count
        } else if section == 2 {
            return resume?.workSummaries.count ?? 1
        } else if section == 3 {
            return resume?.skills.count ?? 1
        } else if section == 4 {
            return resume?.educationDetails.count ?? 1
        } else if section == 5 {
            return resume?.projectDetails.count ?? 1
        }
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        
        if section == 0 {
            var cell = tableView.dequeueReusableCell(withIdentifier: ProfilePhotoCell.identifier)
            
            if cell == nil {
                cell = ProfilePhotoCell.loadNib()
            }
            
            return cell!
        } else if section == 1 {
            var cell = tableView.dequeueReusableCell(withIdentifier: FieldCell.identifier) as? FieldCell
            
            if cell == nil {
                cell = FieldCell.loadNib()
                cell?.textField.delegate = self
            }
            
            if indexPath.section == 1 {
                if indexPath.row == 1 {
                    cell?.textField.keyboardType = .emailAddress
                } else if indexPath.row == 4 {
                    cell?.textField.keyboardType = .numberPad
                }
            }
            
            let title = titles[indexPath.row]
            cell?.setup(title: title)
            
            return cell!
        } else if section == 2 {
            if resume == nil || resume!.workSummaries.count == 0 {
                return createAddItemCell(title: "Add Work Experience", indexPath: indexPath)
            } else {
                var cell = tableView.dequeueReusableCell(withIdentifier: WorkSummaryCell.identifier) as? WorkSummaryCell
                if cell == nil {
                    cell = WorkSummaryCell.loadNib()
                }
                
                if let summary = resume?.workSummaries[indexPath.row] {
                    cell?.setup(workSummary: summary)
                }
                
                return cell!
            }
        } else if section == 3 {
            if resume == nil || resume!.skills.count == 0 {
                return createAddItemCell(title: "Add Skill", indexPath: indexPath)
            } else {
                var cell = tableView.dequeueReusableCell(withIdentifier: SkillCell.identifier) as? SkillCell
                
                if cell == nil {
                    cell = SkillCell.loadNib()
                }
                
                if let skill = resume?.skills[indexPath.row] {
                    cell?.setup(skill: skill)
                }
                
                return cell!
            }
        } else if section == 4 {
            if resume == nil || resume!.educationDetails.count == 0 {
                return createAddItemCell(title: "Add Education", indexPath: indexPath)
            } else {
                var cell = tableView.dequeueReusableCell(withIdentifier: EducationDetailCell.identifier) as? EducationDetailCell
                
                if cell == nil {
                    cell = EducationDetailCell.loadNib()
                }
                
                if let education = resume?.educationDetails[indexPath.row] {
                    cell?.setup(education: education)
                }
                
                return cell!
            }
        } else {
            if resume == nil || resume!.projectDetails.count == 0 {
                return createAddItemCell(title: "Add Project", indexPath: indexPath)
            } else {
                var cell = tableView.dequeueReusableCell(withIdentifier: ProjectDetailCell.identifier) as? ProjectDetailCell
                
                if cell == nil {
                    cell = ProjectDetailCell.loadNib()
                }
                
                if let project = resume?.projectDetails[indexPath.row] {
                    cell?.setup(project: project)
                }
                
                return cell!
            }
        }
    }
        
    // MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - UITextFieldDelegate
    func textFieldDidEndEditing(_ textField: UITextField) {
        let postion = textField.convert(textField.bounds.origin, to: tableView)

        guard let indexPath = tableView.indexPathForRow(at: postion) else {
            return
        }
        
        guard let text = textField.text, !text.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        
        if indexPath.section == 1 {
            if indexPath.row == 0 {
                Resume.shared.mobileNumber = text
            } else if indexPath.row == 1 {
                Resume.shared.emailAddress = text
            } else if indexPath.row == 2 {
                Resume.shared.residenceAddress = text
            } else if indexPath.row == 3 {
                Resume.shared.careerObjective = text
            } else if indexPath.row == 4, let num = Int(text) {
                Resume.shared.yearsOfExperience = num
            }
        }
    }
    
    // MARK: - Private
    func createAddItemCell(title: String, indexPath: IndexPath) -> AddItemCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: AddItemCell.identifier) as? AddItemCell
        if cell == nil {
            cell = AddItemCell.loadNib()
        }
        
        cell?.setup(title: title)
        cell?.addButton.addTarget(self, action: #selector(addItem(_:)), for: .touchUpInside)
        
        return cell!
    }
    
    @objc func addItem(_ sender: UIButton) {
        let postion = sender.convert(sender.bounds.origin, to: tableView)

        if let indexPath = tableView.indexPathForRow(at: postion) {
            let section = indexPath.section
            var controller: UIViewController?
            
            if section == 2 {
                controller = WorkSummaryViewController()
            } else if section == 3 {
                controller = SkillViewController()
            } else if section == 4 {
                controller = EducationDetailViewController()
            } else if section == 5 {
                controller = ProjectDetailViewController()
            }
            
            if let controller = controller {
                let nav = UINavigationController(rootViewController: controller)
                present(nav, animated: true)
            }
        }
    }
    
    
}
