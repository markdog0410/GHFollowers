//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by Tsai Ming Chen on 2024/3/4.
//

import Foundation

extension Date {
    
    func converToMonthYearFormat() -> String {
        let dateFormatter        = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
