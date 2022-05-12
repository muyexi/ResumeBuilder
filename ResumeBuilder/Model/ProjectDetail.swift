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
        guard let name = name, !name.trimmingCharacters(in: .whitespaces).isEmpty,
              let _ = teamSize,
              let summary = summary, !summary.trimmingCharacters(in: .whitespaces).isEmpty,
              let technologies = usedTechnologies, !technologies.trimmingCharacters(in: .whitespaces).isEmpty,
              let role = role, !role.trimmingCharacters(in: .whitespaces).isEmpty else {
            return (false, "Missing Data")
        }
        
        return (true, nil)
    }
}
