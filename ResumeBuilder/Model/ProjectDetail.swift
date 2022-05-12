//
//  ProjectDetail.swift
//  ResumeBuilder
//
//  Created by muyexi on 2022/5/10.
//

import Foundation

struct ProjectDetail: Codable, FormModelProtocol {
    var name: String?
    var teamSize: Int?
    var summary: String?
    var usedTechnologies: String?
    var role: String?
    
    func validate() -> (isValid: Bool, msg: String?) {
        if teamSize == nil
              || name.isNilOrEmpty
              || summary.isNilOrEmpty
              || usedTechnologies.isNilOrEmpty
              || role.isNilOrEmpty {
            return (false, "Missing Data")
        }
        
        return (true, nil)
    }
}
