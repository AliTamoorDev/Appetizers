//
//  DateExtension.swift
//  Appetizers
//
//  Created by Ali Tamoor on 25/01/2024.
//

import Foundation

extension Date {
    var eighteenYearsAgo: Date {
        return Calendar.current.date(byAdding: .year, value: -18, to: Date())!
    }
    
    var oneHundredYearAgo: Date {
        return Calendar.current.date(byAdding: .year, value: -110, to: Date())!
    }
}
