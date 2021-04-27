//
//  UIImage+CA.swift
//  Bootia
//
//  Created by Diego Varangot on 24/4/21.
//

import UIKit

extension UIImage {

    static func image(name: String) -> UIImage {
        return UIImage(named: name) ?? UIImage()
    }
}
