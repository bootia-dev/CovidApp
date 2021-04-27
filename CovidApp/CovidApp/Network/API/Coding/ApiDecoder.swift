//
//  ApiDecoder.swift
//  CovidApp
//
//  Created by Diego Varangot on 24/4/21.
//

import Foundation

class ApiDecoder: JSONDecoder {

    override init() {
        super.init()

        keyDecodingStrategy = .convertFromSnakeCase
        dateDecodingStrategy = .custom({ (decoder) -> Date in
            let container = try decoder.singleValueContainer()
            let dateStr = try container.decode(String.self)
            // possible date strings: "2016-05-01",  "2016-07-04T17:37:21.119229Z"
            let len = dateStr.count
            var date: Date? = nil
            if len == 10 {
                date = DateFormatter.short().date(from: dateStr)
            } else if len == 20 {
                date = DateFormatter.apiFormat().date(from: dateStr)
            }
            
            guard let date_ = date else {
                throw DecodingError.dataCorruptedError(in: container, debugDescription: "Cannot decode date string \(dateStr)")
            }
            
            print("DATE DECODER \(dateStr) to \(date_)")
            return date_
        })
    }
}
