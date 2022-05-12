//
//  EducationDetail.swift
//  ResumeBuilder
//
//  Created by muyexi on 2022/5/10.
//

import Foundation

enum EducationClass: String, Codable {
    case x = "X"
    case xii = "XII"
    case graduation = "Graduation"
}

struct EducationDetail: Codable, FormModelProtocol {
    var educationClass: String?
    var passingYear: String?
    var cgpa: String?
    
    func validate() -> (isValid: Bool, msg: String?) {
        guard let _ = educationClass, let passingYear = passingYear, let cgpa = cgpa else {
            return (false, "Missing data")
        }
        
        if Int(passingYear) == nil {
            return (false, "Wrong Passing Year")
        }
        
        if Double(cgpa) == nil {
            return (false, "Wrong CGPA")
        }
        
        return (true, nil)
    }
}
