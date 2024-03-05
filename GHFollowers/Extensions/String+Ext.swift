//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by Tsai Ming Chen on 2024/3/4.
//

import Foundation

extension String {
    
    func converToDate() -> Date? {
        let dateFormatter        = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-DD'T'HH:mm:ssZ"
        dateFormatter.locale     = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone   = .current
        
        return dateFormatter.date(from: self)
    }
    
    func converToDisplayFormat() -> String {
        guard let date = self.converToDate() else { return "N/A" }
        return date.converToMonthYearFormat()
    }
}
