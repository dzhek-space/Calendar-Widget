//
//  CellView.swift
//  Widget
//
//  Created by Dzhek on 05.06.2020.
//  Copyright © 2020 Dzhek. All rights reserved.
//

import Cocoa

final class CellView: NSTextView {
    
    private let size = CGSize(width: 38, height: 26)
    private var kind: CellView.Kind! = nil
    private var value: String! = nil
    
    // MARK: -
    
    convenience init(origin: CGPoint) {
        self.init(frame: NSRect.zero)
        self.frame = NSRect(origin: origin, size: size)
        configureView()
    }
    
    private func configureView() {
        backgroundColor = NSColor.clear
        isHorizontallyResizable = false
        isVerticallyResizable = false
        isEditable = false
        isSelectable = false
        alignment = .center
        font = NSFont.body
        
    }
    
    func bindModel(kind: CellView.Kind, value: String) {
        string = value
        switch kind {
        case .weekdaySymbol, .weekend:
            alphaValue = 0.6
        case .weekday, .today:
            alphaValue = 0.9
        case .extraday, .numberWeek:
            alphaValue = 0.3
        }
        if kind == .numberWeek {
            font = NSFont.footnote
        }
        
    }
    
}


// MARK: - Kind of CellView

extension CellView {
    
    enum Kind {
        case weekdaySymbol
        case numberWeek
        case weekday
        case weekend
        case today
        case extraday
        
    }
    
}
