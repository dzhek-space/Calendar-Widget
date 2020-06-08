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
    
    // MARK: -
    
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

// MARK: - Interface

extension PresentedMonthLabel {
    
    func setNewValue(_ value: String, bias: Int) {
        NSView.animate(withDuration: 0.175,
                       timingFunction: CAMediaTimingFunction(name: .easeIn),
                       animations: {
                        self.frame.origin.x += CGFloat(4 * bias)
                        self.alphaValue = 0
        }) {
            self.frame.origin.x -= CGFloat(8 * bias)
            self.string = value
            NSView.animate(withDuration: 0.1,
                           delay: 0.125,
                           timingFunction: CAMediaTimingFunction(name: .easeOut),
                           animations: {
                            self.frame.origin.x += CGFloat(4 * bias)
                            self.alphaValue = 1
            })
        }
    }
    
}
