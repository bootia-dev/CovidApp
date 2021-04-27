//
//  UIFont+CA.swift
//  Bootia
//
//  Created by Diego Varangot on 24/4/21.
//

import UIKit

extension UIFont {
    struct NavigationBar {
        static let title: UIFont = .semiBold(with: 20)
    }
    
    struct Buttons {
        static let primary: UIFont = .semiBold(with: 20)
        static let secondary: UIFont = .semiBold(with: 20)
        static let showHide: UIFont = .semiBold(with: 12)
    }
    
    struct Labels {
        static let title1: UIFont = .regular(with: 12)
        static let title2: UIFont = .semiBold(with: 14)
        static let value1: UIFont = .bold(with: 14)
    }

    static func bold(with size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Black", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    static func regular(with size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Roman", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    static func light(with size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Light", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    static func semiBold(with size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Heavy", size: size) ?? UIFont.systemFont(ofSize: size)
    }
}
