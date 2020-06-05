//
//  CalendarView.swift
//  Widget
//
//  Created by Dzhek on 05.06.2020.
//  Copyright © 2020 Dzhek. All rights reserved.
//

import Cocoa

final class CalendarView: NSView {
    
    private let size = CGSize(width: 304, height: 148)
    private let rows: Int = 7
    private let columns: Int = 8
    var cells = [CellView]()
    
    // MARK: -
    
    convenience init(origin: CGPoint) {
        self.init(frame: NSRect.zero)
        self.frame = NSRect(origin: origin, size: size)
        configureView()
    }
    
    private func configureView() {
        configureWeekdaySymbolsBlock()
        confugureDatesBlock()
        cells.forEach(addSubview)
    }
    
    private func configureWeekdaySymbolsBlock() {
        for index in 0 ..< columns {
            let value = index == 0 ? "week" : SCCalendar.weekdaySymbol(for: index)
            let origin = CGPoint(x: index * 38, y: 134)
            let weekdaySymbolCell = CellView(origin: origin)
            weekdaySymbolCell.bindModel(kind: .weekdaySymbol, value: value)
            cells.append(weekdaySymbolCell)
        }
    }
    
    private func confugureDatesBlock() {
        for indexRow in 0 ..< rows {
            for indexColumn in 0 ..< columns {
                let origin = CGPoint(x: indexColumn * 38,
                                     y: 113 - (indexRow * 21))
                let cell = CellView(origin: origin)
                cells.append(cell)
            }
        }
    }
    
}

