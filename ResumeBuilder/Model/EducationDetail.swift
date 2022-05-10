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

struct EducationDetail: Codable {
    var educationClass: EducationClass?
    var passingYear: Int?
    var cgpa: Double?
}
