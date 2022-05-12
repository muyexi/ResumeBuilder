//
//  BasicInfo.swift
//  ResumeBuilder
//
//  Created by muyexi on 2022/5/12.
//

import Foundation

struct BasicInfo: Codable, FormModelProtocol {
    var mobileNumber: String?
    var emailAddress: String?
    var residenceAddress: String?
    
    var careerObjective: String?
    var yearsOfExperience: String?
    
    func validate() -> (isValid: Bool, msg: String?) {
        guard let mobileNumber = mobileNumber, !mobileNumber.trimmingCharacters(in: .whitespaces).isEmpty,
              let emailAddress = emailAddress, !emailAddress.trimmingCharacters(in: .whitespaces).isEmpty,
              let residenceAddress = residenceAddress, !residenceAddress.trimmingCharacters(in: .whitespaces).isEmpty,
              let careerObjective = careerObjective, !careerObjective.trimmingCharacters(in: .whitespaces).isEmpty,
              let yearsOfExperience = yearsOfExperience, !yearsOfExperience.trimmingCharacters(in: .whitespaces).isEmpty else {
            return (false, "Missing Data")
        }
                
        return (true, nil)
    }
}
