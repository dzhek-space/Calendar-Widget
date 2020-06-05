//
//  CircleView.swift
//  Widget
//
//  Created by Dzhek on 05.06.2020.
//  Copyright © 2020 Dzhek. All rights reserved.
//

import Cocoa

final class CircleView: NSView {

    var backgroundColor = NSColor.shadowColor
    var borderColor = NSColor(named: NSColor.Name(stringLiteral: "accent")) ?? .systemOrange
    var borderWidth: CGFloat = 0.8
    var cornerRadius:CGFloat = 11
    
    override var wantsUpdateLayer: Bool { true }
    
    override func updateLayer() {
        guard let layer = layer
            else { return }
        layer.backgroundColor = backgroundColor.withAlphaComponent(0.1).cgColor
        layer.cornerRadius = cornerRadius
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
    }
    
}
