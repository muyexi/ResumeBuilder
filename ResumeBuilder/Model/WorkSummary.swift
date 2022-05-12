//
//  WorkSummary.swift
//  ResumeBuilder
//
//  Created by muyexi on 2022/5/10.
//

import Foundation

protocol FormModelProtocol {
    init()
    func validate() -> (isValid: Bool, msg: String?)
}

struct WorkSummary: Codable, FormModelProtocol {
    var companyName: String?
    var duration: String?
    
    func validate() -> (isValid: Bool, msg: String?) {
        if companyName == nil || !companyName!.trimmingCharacters(in: .whitespaces).isEmpty {
            return (false, "Missing Company Name")
        } else if companyName == nil || !duration!.trimmingCharacters(in: .whitespaces).isEmpty {
            return (false, "Missing Duration")
        } else {
            return (true, nil)
        }
    }
}
