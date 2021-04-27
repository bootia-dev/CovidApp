//
//  Array+CA.swift
//  CovidApp
//
//  Created by Diego Varangot on 24/4/21.
//

extension Array {
    func item(at index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
