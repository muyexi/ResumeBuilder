//
//  ViewController.swift
//  ResumeBuilder
//
//  Created by muyexi on 2022/5/10.
//

import UIKit

class ResumeViewController: BaseFormViewController<BasicInfo>, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var resume: Resume?
    
    var imagePicker = UIImagePickerController()
    
    override var titles: [String] {
        return ["Mobile Number", "Email Address", "Residence Address", "Career Objective", "Total Years of experience"]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.separatorColor = .clear
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Print", style: .done, target: self, action: #selector(share))
        
        if let info = resume?.basicInfo {
            model = info
        } else {
            model = BasicInfo()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if model.validate().isValid {
            resume?.basicInfo = model
        }
        
        resume?.save()
        completion?(self.model)
    }
    
    // MARK: - UITableViewDataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return super.tableView(tableView, numberOfRowsInSection: section)
        } else if section == 2 {
            if let count = resume?.workSummaries.count, count > 0 {
                return count + 1
            } else {
                return 1
            }
        } else if section == 3 {
            if let count = resume?.skills.count, count > 0 {
                return count + 1
            } else {
                return 1
            }
        } else if section == 4 {
            if let count = resume?.educationDetails.count, count > 0 {
                return count + 1
            } else {
                return 1
            }
        } else if section == 5 {
            if let count = resume?.projectDetails.count, count > 0 {
                return count + 1
            } else {
                return 1
            }
        }
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        
        if section == 0 {
            var cell = tableView.dequeueReusableCell(withIdentifier: ProfilePhotoCell.identifier) as? ProfilePhotoCell
            
            if cell == nil {
                cell = ProfilePhotoCell.loadNib()
                cell?.profileImageButton.addTarget(self, action: #selector(pickPhoto), for: .touchUpInside)
            }
            
            if let picture = self.resume?.picture, let image = UIImage(data: picture) {
                cell?.profileImageButton.setBackgroundImage(image, for: .normal)
            }
            
            return cell!
        } else if section == 1 {
            let cell = super.tableView(tableView, cellForRowAt: indexPath) as? FieldCell
            let info = resume?.basicInfo
            
            let fields = [info?.mobileNumber, info?.emailAddress, info?.residenceAddress, info?.careerObjective, info?.yearsOfExperience]
            cell?.textField.text = fields[indexPath.row]
            
            return cell!
        } else if section == 2 {
            if let count = resume?.workSummaries.count, count > 0, indexPath.row < count {
                var cell = tableView.dequeueReusableCell(withIdentifier: WorkSummaryCell.identifier) as? WorkSummaryCell
                if cell == nil {
                    cell = WorkSummaryCell.loadNib()
                }
                
                if let summary = resume?.workSummaries[indexPath.row] {
                    cell?.setup(workSummary: summary)
                }
                
                return cell!
            } else {
                return createAddItemCell(title: "Add Work Experience", indexPath: indexPath)
            }
        } else if section == 3 {
            if let count = resume?.skills.count, count > 0, indexPath.row < count {
                var cell = tableView.dequeueReusableCell(withIdentifier: SkillCell.identifier) as? SkillCell
                
                if cell == nil {
                    cell = SkillCell.loadNib()
                }
                
                if let skill = resume?.skills[indexPath.row].name {
                    cell?.setup(skill: skill)
                }
                
                return cell!
            } else {
                return createAddItemCell(title: "Add Skill", indexPath: indexPath)
            }
        } else if section == 4 {
            if let count = resume?.educationDetails.count, count > 0, indexPath.row < count {
                var cell = tableView.dequeueReusableCell(withIdentifier: EducationDetailCell.identifier) as? EducationDetailCell
                
                if cell == nil {
                    cell = EducationDetailCell.loadNib()
                }
                
                if let education = resume?.educationDetails[indexPath.row] {
                    cell?.setup(education: education)
                }
                
                return cell!
            } else {
                return createAddItemCell(title: "Add Education", indexPath: indexPath)
            }
        } else {
            if let count = resume?.projectDetails.count, count > 0, indexPath.row < count {
                var cell = tableView.dequeueReusableCell(withIdentifier: ProjectDetailCell.identifier) as? ProjectDetailCell
                
                if cell == nil {
                    cell = ProjectDetailCell.loadNib()
                }
                
                if let project = resume?.projectDetails[indexPath.row] {
                    cell?.setup(project: project)
                }
                
                return cell!
            } else {
                return createAddItemCell(title: "Add Project", indexPath: indexPath)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 2 {
            if let count = resume?.workSummaries.count, count > 0 {
                return "Work Experience"
            }
        } else if section == 3 {
            if let count = resume?.skills.count, count > 0 {
                return "Skills"
            }
        } else if section == 4 {
            if let count = resume?.educationDetails.count, count > 0 {
                return "Eductions"
            }
        } else if section == 5 {
            if let count = resume?.projectDetails.count, count > 0 {
                return "Projects"
            }
        }
        
        return nil
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        let section = indexPath.section
        
        if section == 2 {
            if let count = resume?.workSummaries.count, count > 0 {
                return true
            }
        } else if section == 3 {
            if let count = resume?.skills.count, count > 0 {
                return true
            }
        } else if section == 4 {
            if let count = resume?.educationDetails.count, count > 0 {
                return true
            }
        } else if section == 5 {
            if let count = resume?.projectDetails.count, count > 0 {
                return true
            }
        }
        
        return false
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let section = indexPath.section
        let row = indexPath.row
        
        if section == 2 {
            if let count = resume?.workSummaries.count, count > 0, editingStyle == .delete {
                resume?.workSummaries.remove(at: row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        } else if section == 3 {
            if let count = resume?.skills.count, count > 0 {
                resume?.skills.remove(at: row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        } else if section == 4 {
            if let count = resume?.educationDetails.count, count > 0 {
                resume?.educationDetails.remove(at: row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        } else if section == 5 {
            if let count = resume?.projectDetails.count, count > 0 {
                resume?.projectDetails.remove(at: row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    }
    
    // MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - BaseFormProtocol
    override func didEdit(text: String, indexPath: IndexPath) {
        if indexPath.section == 1 {
            if indexPath.row == 0 {
                model.mobileNumber = text
            } else if indexPath.row == 1 {
                model.emailAddress = text
            } else if indexPath.row == 2 {
                model.residenceAddress = text
            } else if indexPath.row == 3 {
                model.careerObjective = text
            } else if indexPath.row == 4 {
                model.yearsOfExperience = text
            }
        }
    }
    
    // MARK: - UIImagePickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        if let image = info[.originalImage] as? UIImage {
            resume?.picture = image.pngData()
            tableView.reloadData()
        }
    }
    
    // MARK: - Private
    func createAddItemCell(title: String, indexPath: IndexPath) -> AddItemCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: AddItemCell.identifier) as? AddItemCell
        if cell == nil {
            cell = AddItemCell.loadNib()
        }
        
        cell?.setup(title: title)
        cell?.addButton.addTarget(self, action: #selector(addResumeItem(_:)), for: .touchUpInside)
        
        return cell!
    }
    
    @objc func addResumeItem(_ sender: UIButton) {
        let postion = sender.convert(sender.bounds.origin, to: tableView)

        if let indexPath = tableView.indexPathForRow(at: postion) {
            let section = indexPath.section
            var controller: UIViewController?
            
            if section == 2 {
                controller = WorkSummaryViewController(completion: { obj in
                    self.resume?.workSummaries.append(obj)
                    self.tableView.reloadData()
                })
            } else if section == 3 {
                controller = SkillViewController(completion: { obj in
                    self.resume?.skills.append(obj)
                    self.tableView.reloadData()
                })
            } else if section == 4 {
                controller = EducationDetailViewController(completion: { obj in
                    self.resume?.educationDetails.append(obj)
                    self.tableView.reloadData()
                })
            } else if section == 5 {
                controller = ProjectDetailViewController(completion: { obj in
                    self.resume?.projectDetails.append(obj)
                    self.tableView.reloadData()
                })
            }
            
            if let controller = controller {
                let nav = UINavigationController(rootViewController: controller)
                present(nav, animated: true)
            }
        }
    }
    
    @objc func pickPhoto() {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false

            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @objc func share() {
        let url = tableView.createPDF()
        printPDF(fileURL: url)
    }
    
    func printPDF(fileURL: URL) {
        if UIPrintInteractionController.canPrint(fileURL) {
            let printInfo = UIPrintInfo(dictionary: nil)
            printInfo.jobName = fileURL.lastPathComponent
            printInfo.outputType = .photo

            let printController = UIPrintInteractionController.shared
            printController.printInfo = printInfo
            printController.showsNumberOfCopies = false

            printController.printingItem = fileURL

            printController.present(animated: true)
      }
    }
}
