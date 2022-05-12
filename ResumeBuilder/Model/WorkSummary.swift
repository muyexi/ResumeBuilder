//
//  WorkSummary.swift
//  ResumeBuilder
//
//  Created by muyexi on 2022/5/10.
//

import Foundation

protocol FormModelProtocol {
    func isValid() -> Bool
}

struct WorkSummary: Codable, FormModelProtocol {
    var companyName: String?
    var duration: String?
    
    func isValid() -> Bool {
        guard let companyName = companyName, let duration = duration else {
            return false
        }
        
        return !companyName.trimmingCharacters(in: .whitespaces).isEmpty && !duration.trimmingCharacters(in: .whitespaces).isEmpty
    }
}
