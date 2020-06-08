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
    private var model: CellViewModel!
    
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
    
    func bindModel(_ model: CellViewModel) {
        string = model.value
        switch model.kind {
            case .weekdaySymbol, .weekend:
                alphaValue = 0.6
        case .weekday, .today:
                alphaValue = 0.9
            case .extraday, .numberWeek:
                alphaValue = 0.3
            }
        if model.kind == .numberWeek {
            font = NSFont.footnote
        }
        
    }
    
}
