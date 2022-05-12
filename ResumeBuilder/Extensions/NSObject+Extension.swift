//
//  NSObject+Extension.swift
//  ResumeBuilder
//
//  Created by muyexi on 2022/5/11.
//

import Foundation

extension NSObject {
    static var identifier: String {
        return String(describing: self)
    }
}
