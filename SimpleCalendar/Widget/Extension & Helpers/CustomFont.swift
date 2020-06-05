//
//  CustomFont.swift
//  Widget
//
//  Created by Dzhek on 05.06.2020.
//  Copyright © 2020 Dzhek. All rights reserved.
//

import Cocoa

extension NSFont {
    static let monthLabel = NSFont.systemFont(ofSize: NSFont.systemFontSize, weight: .regular)
    static let controls = NSFont.systemFont(ofSize: NSFont.systemFontSize - 1, weight: .light)
    static let body = NSFont.systemFont(ofSize: NSFont.systemFontSize - 2, weight: .regular)
    static let footnote = NSFont.systemFont(ofSize: NSFont.systemFontSize - 2, weight: .thin)
    
}
