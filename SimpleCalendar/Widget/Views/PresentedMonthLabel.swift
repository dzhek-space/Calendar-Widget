//
//  PresentedMonthLabel.swift
//  Widget
//
//  Created by Dzhek on 05.06.2020.
//  Copyright © 2020 Dzhek. All rights reserved.
//

import Cocoa

final class PresentedMonthLabel: NSTextView {

    private let size = CGSize(width: 144, height: 21)
    
    convenience init(origin: CGPoint, value: String) {
        self.init(frame: NSRect.zero)
        self.frame = NSRect(origin: origin, size: size)
        self.string = value
        configureView()
    }
    
    private func configureView() {
        backgroundColor = NSColor.clear
        font = NSFont.monthLabel
        isEditable = false
        isSelectable = false
        alignment = .natural
    }
    
}
