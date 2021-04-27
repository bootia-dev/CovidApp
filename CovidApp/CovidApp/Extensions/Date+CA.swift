//
//  Date+CA.swift
//  Bootia
//
//  Created by Diego Varangot on 24/4/21.
//

import Foundation

extension Date {
    init(year: Int, month: Int, day: Int) {
        self.init()
        
        let gregorianCalendar = NSCalendar(calendarIdentifier: .gregorian)!

        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day

        self = gregorianCalendar.date(from: dateComponents) ?? Date()
    }
    
    static func from(year: Int, month: Int, day: Int) -> Date {
        let gregorianCalendar = NSCalendar(calendarIdentifier: .gregorian)!

        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day

        let date = gregorianCalendar.date(from: dateComponents)!
        return date
    }
    
    func prettyToString() -> String {
        return DateFormatter.prettyFormat().string(from: self)
    }
    
    func shortToString() -> String {
        return DateFormatter.short().string(from: self)
    }
}
