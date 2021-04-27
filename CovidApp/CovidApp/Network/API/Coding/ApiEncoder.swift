//
//  ApiEncoder.swift
//  CovidApp
//
//  Created by Diego Varangot on 24/4/21.
//
import Foundation

class ApiEncoder: JSONEncoder {

    override init() {
        super.init()

        keyEncodingStrategy = .convertToSnakeCase
        dateEncodingStrategy = .formatted(DateFormatter.apiFormat())
    }
}
