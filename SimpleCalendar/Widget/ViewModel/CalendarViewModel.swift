//
//  CalendarViewModel.swift
//  Widget
//
//  Created by Dzhek on 08.06.2020.
//  Copyright © 2020 Dzhek. All rights reserved.
//

import Foundation

final class CalendarViewModel {
    
    var biasOfMonths = 0
    var presentedMonth: String { DatesController.presentedMonth(withBiasOfMonths: self.biasOfMonths) }
    var weekSymbols: [CellViewModel] { calculateSymbolsBlock() }
    var presentedBlock: [CellViewModel] { calculateDatesBlock() }
    var today: (Int, CellViewModel.Kind)?
    
    
    // MARK: -
    
    private func calculateSymbolsBlock() -> [CellViewModel] {
        var block = [CellViewModel]()
        block.reserveCapacity(8)
        for index in 0...7 {
            let value = index == 0 ? "week" : SCCalendar.weekdaySymbol(for: index)
            block.append(CellViewModel(kind: .weekdaySymbol, value: value))
        }
        return block
    }

    
    private func calculateDatesBlock() -> [CellViewModel] {
        var currentBlock = [CellViewModel]()
        currentBlock.reserveCapacity(48)
        
        let block = DatesController.currentBlock(withBiasOfMonths: self.biasOfMonths)
        for index in 0 ..< block.count {
            
            let value: String
            switch block[index].type {
                case .weekNumber: value = "#\(block[index].value)"
                case .weekday, .weekend, .irrelevant: value = "\(block[index].value)"
            }
            let kind: CellViewModel.Kind
            switch block[index].type {
                case .weekNumber: kind = .numberWeek
                case .weekday: kind = .weekday
                case .weekend: kind = .weekend
                case .irrelevant: kind = .extraday
            }
            currentBlock.append(CellViewModel(kind: kind, value: value))
            
            if block[index].isToday { today = (index, kind) }
            
        }
        
        return currentBlock
    }
    
}
