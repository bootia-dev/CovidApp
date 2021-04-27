//
//  UILabel+CA.swift
//  CovidApp
//
//  Created by Diego Varangot on 24/4/21.
//

import UIKit

extension UILabel {
    func apply(font: UIFont, color: UIColor, background: UIColor) {
        backgroundColor = background
        textColor = color
        self.font = font
    }
}
