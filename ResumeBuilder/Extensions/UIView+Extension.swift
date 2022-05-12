//
//  UIView+Extension.swift
//  ResumeBuilder
//
//  Created by muyexi on 2022/5/10.
//

import Foundation
import UIKit

extension UIView {
    static func loadNib() -> Self {
        func loadNib<T: UIView>(_ viewType: T.Type) -> T {
            let bundle = Bundle(for: self)
            let name = String(describing: self)
            
            return bundle.loadNibNamed(name, owner: nil, options: nil)?.first as! T
        }
        
        return loadNib(self)
    }
}
