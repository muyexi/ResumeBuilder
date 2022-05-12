//
//  Resume.swift
//  ResumeBuilder
//
//  Created by muyexi on 2022/5/10.
//

import Foundation
import UIKit

struct Resume: Codable, FormModelProtocol {
    var picture: Data?
    var basicInfo: BasicInfo?
    
    var workSummaries: [WorkSummary] = []
    var skills: [Skill] = []
    var educationDetails: [EducationDetail] = []
    var projectDetails: [ProjectDetail] = []
    
    func validate() -> (isValid: Bool, msg: String?) {
        let isValid = picture != nil
        || basicInfo != nil
        || workSummaries.count > 0
        || skills.count > 0
        || educationDetails.count > 0
        || projectDetails.count > 0
        
        return (isValid, nil)
    }
    
    func save() {
        if !validate().isValid {
            return
        }
        
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(self)

            UserDefaults.standard.set(data, forKey: "Resume")
        } catch {
            print(error)
        }
    }
    
    static func read() -> Resume? {
        if let data = UserDefaults.standard.data(forKey: "Resume") {
            do {
                let decoder = JSONDecoder()
                let resume = try decoder.decode(Resume.self, from: data)
                
                return resume
            } catch {
                print(error)
            }
        }
        
        return nil
    }
}
