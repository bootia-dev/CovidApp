//
//  Global.swift
//  CovidApp
//
//  Created by Diego Varangot on 24/4/21.
//

import Foundation

struct GlobalData: Decodable {
    var count: Int
    var date: Date
    var result: GlobalResult
}

struct GlobalRangeData: Decodable {
    var count: Int
    var fromDate: Date
    var toDate: Date
    var result: GlobalResult
}
