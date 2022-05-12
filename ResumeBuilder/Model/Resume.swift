//
//  Resume.swift
//  ResumeBuilder
//
//  Created by muyexi on 2022/5/10.
//

import Foundation

struct Resume: Codable {
    static var shared = Resume()

    private init() {}
    
    var picture: String?
    var mobileNumber: String?
    var emailAddress: String?
    var residenceAddress: String?
    
    var careerObjective: String?
    var yearsOfExperience: Int?
    
    var workSummaries: [WorkSummary] = []
    var skills: [String] = []
    var educationDetails: [EducationDetail] = []
    var projectDetails: [ProjectDetail] = []
    
    func save() {
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
