//
//  File.swift
//  ResumeBuilder
//
//  Created by muyexi on 2022/5/12.
//

import Foundation

protocol OptionalString {}
extension String: OptionalString {}

extension Optional where Wrapped: OptionalString {
    var isNilOrEmpty: Bool {
        return ((self as? String) ?? "").isEmpty
    }
}
