//
//  NSObject+CA.swift
//  Bootia
//
//  Created by Diego Varangot on 24/4/21.
//

import Foundation

extension NSObject {

    class var className: String {
        return String(describing: self)
    }

    class var nibName: String {
        if let name = String(describing: self).components(separatedBy: ".").last {
            return name
        }
        return String(describing: self)
    }
}
