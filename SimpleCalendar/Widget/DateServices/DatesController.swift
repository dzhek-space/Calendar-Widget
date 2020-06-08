//
//  DatesController.swift
//  Widget
//
//  Created by Dzhek on 05.06.2020.
//  Copyright © 2020 Dzhek. All rights reserved.
//

import Foundation

fileprivate func calculateInitialDate(with bias: Int) -> Date {
    let components = DateComponents(month: bias)
    return SCCalendar.current.date(byAdding: components, to: Date())!
}

struct DatesController {
    
    private let initialDate: Date
    
    /// The block displays 42 days. The first day falls on Monday of the last week of the previous month.
    /// 'factor' - day shift at the beginning of the week
    private var firstDateInBlock: Date? {
        guard let beginningOfMonth = SCCalendar.current.dateInterval(of: .month, for: initialDate)?.start
            else { return nil }
        let numberWeekday = SCCalendar.current.component(.weekday, from: beginningOfMonth)
        let factor: Int
        switch numberWeekday {
            case 1: factor = 6
            case 2: factor = 7
            case 3: factor = 8
            default: factor = numberWeekday - 2
        }
        let numberDaysPreviousMonth = DateComponents(day: -factor)
        return SCCalendar.current.date(byAdding: numberDaysPreviousMonth, to: beginningOfMonth)
        
    }

    private var endDateInBlock: Date? {
        let numberDaysInBlock = DateComponents(day: 42)
        guard let firstDate = firstDateInBlock
            else { return nil }
        return SCCalendar.current.date(byAdding: numberDaysInBlock, to: firstDate)
        
    }
    
    
    // MARK: - Methods
    
    init(with initialDate: Date) {
        self.initialDate = initialDate
    }

    private func setDatesBlock() -> [SCDate] {
        guard let firstDate = firstDateInBlock,
            let endDate = endDateInBlock
            else { return [] }
        var calendarBlock = [SCDate]()
        calendarBlock.reserveCapacity(48) // 6*8
        let components = SCCalendar.current.dateComponents(
            [.hour, .minute, .second],
            from: initialDate
        )
        
        let handler: (Date?, Bool, inout Bool) -> Void = { (date, _, stop) in
            guard let date = date, date < endDate
                else { stop = true; return }
            let value = SCCalendar.current.component(.day, from: date)
            let isToday = SCCalendar.current.dateInterval(of: .day, for: date) == SCCalendar.today
            let dateType: SCDateType
            let isPresentedMonth = SCCalendar.current.isDate(date, equalTo: self.initialDate, toGranularity: .month)
            if isPresentedMonth {
                dateType = SCCalendar.current.isDateInWeekend(date) ? .weekend : .weekday
            } else {
                dateType = .irrelevant
            }
            
            if calendarBlock.count % 8 == 0 {
                let numberWeekOfYear = SCCalendar.current.component(.weekOfYear, from: date)
                let numberWeek = SCDate(value: numberWeekOfYear, type: .weekNumber, isToday: false)
                calendarBlock.append(numberWeek)
            }
            
            let day = SCDate(value: value, type: dateType, isToday: isToday)
            calendarBlock.append(day)
        }
        
        SCCalendar.current.enumerateDates(startingAfter: firstDate,
                                          matching: components,
                                          matchingPolicy: .nextTime,
                                          using: handler)
        return calendarBlock
    }
    
}


// MARK: - Interface

extension DatesController {
    
    static func presentedMonth(withBiasOfMonths bias: Int = 0) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateFormat = "MMMM Y"
        let date = calculateInitialDate(with: bias)
        return formatter.string(from: date)
    }
    
    static func currentBlock(withBiasOfMonths bias: Int = 0) -> [SCDate] {
        let initialDate = calculateInitialDate(with: bias)
        let controller = DatesController(with: initialDate)
        return controller.setDatesBlock()
    }
    
}
