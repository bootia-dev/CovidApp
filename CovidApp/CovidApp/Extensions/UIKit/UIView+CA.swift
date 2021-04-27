//
//  UIView+CA.swift
//  Bootia
//
//  Created by Diego Varangot on 24/4/21.
//

import UIKit

extension UIView {
    func roundCorners(radius: CGFloat? = nil,
                      roundedCorners: CACornerMask? = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]) {
        clipsToBounds = true
        layer.cornerRadius = radius ?? 12
        layer.maskedCorners = roundedCorners ?? [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]

    }

    func borderLine(color: UIColor, width: CGFloat? = nil) {
        layer.borderWidth = width ?? 1.0
        layer.borderColor = color.cgColor
    }
    
    func getClassName() -> String {
        let nameWithTarget = NSStringFromClass(type(of: self))
        let namePaths = nameWithTarget.components(separatedBy: ".")
        
        if namePaths.count > 1 {
            return (namePaths.item(at: 1) ?? "UIView").lowercased()
        }
        
        return NSStringFromClass(type(of: self)).lowercased()
    }
}
