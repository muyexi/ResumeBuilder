//
//  ProjectDetail.swift
//  ResumeBuilder
//
//  Created by muyexi on 2022/5/10.
//

import Foundation

struct ProjectDetail: Codable {
    var projectName: String?
    var teamSize: Int?
    var projectSummary: String?
    var usedTechnologies: [String]?
    var role: String?
}
