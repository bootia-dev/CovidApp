//
//  UIApplication+CA.swift
//  Bootia
//
//  Created by Diego Varangot on 24/4/21.
//

import UIKit

extension UIApplication {
    var rootViewController: UIViewController? {
        return windows.filter({$0.isKeyWindow}).first?.rootViewController
    }
}
