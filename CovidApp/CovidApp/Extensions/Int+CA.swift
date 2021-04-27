//
//  Int+CA.swift
//  CovidApp
//
//  Created by Diego Varangot on 25/4/21.
//

import Foundation

extension Int {
    func toAmountFormat() -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.groupingSeparator = ","
        numberFormatter.groupingSize = 3
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.decimalSeparator = "."
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2

        return numberFormatter.string(from: self as NSNumber)
    }
}
