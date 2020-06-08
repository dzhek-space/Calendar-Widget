//
//  SCCalendar.swift
//  Widget
//
//  Created by Dzhek on 05.06.2020.
//  Copyright © 2020 Dzhek. All rights reserved.
//

import Foundation

final class SCCalendar {
    
    static let current: Calendar = {
        var calendar = Calendar.autoupdatingCurrent
        calendar.locale = Locale.autoupdatingCurrent
        calendar.timeZone = TimeZone.autoupdatingCurrent
        calendar.firstWeekday = 1
        return calendar
    }()
    
}

// MARK: - Interface

extension SCCalendar {
    
    static var today: DateInterval {
        SCCalendar.current.dateInterval(of: .day, for: Date())!
    }
    
    static func weekdaySymbol(for index: Int) -> String {
        SCCalendar.current.shortWeekdaySymbols[index % 7]
    }
    
}
