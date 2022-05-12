//
//  Skill.swift
//  ResumeBuilder
//
//  Created by muyexi on 2022/5/12.
//

import Foundation

struct Skill: Codable, FormModelProtocol {
    var name: String?
    
    func validate() -> (isValid: Bool, msg: String?) {
        guard let name = name, !name.trimmingCharacters(in: .whitespaces).isEmpty else {
            return (false, "Missing Data")
        }
        
        return (true, nil)
    }
}
