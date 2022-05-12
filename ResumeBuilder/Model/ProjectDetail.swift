//
//  ProjectDetail.swift
//  ResumeBuilder
//
//  Created by muyexi on 2022/5/10.
//

import Foundation

struct ProjectDetail: Codable {
    var name: String?
    var teamSize: Int?
    var summary: String?
    var usedTechnologies: [String]?
    var role: String?
}
