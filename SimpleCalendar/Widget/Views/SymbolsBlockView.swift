//
//  SymbolsBlockView.swift
//  Widget
//
//  Created by Dzhek on 08.06.2020.
//  Copyright © 2020 Dzhek. All rights reserved.
//

import Cocoa

final class SymbolsBlockView: NSView {
    
    private let size = CGSize(width: 304, height: 21)
    private let columns: Int = 8
    private var model: [CellViewModel]!
    private var symbolСells: [CellView]!
    
    // MARK: -
    
    convenience init(origin: CGPoint, model: [CellViewModel]) {
        self.init(frame: NSRect.zero)
        self.frame = NSRect(origin: origin, size: size)
        self.model = model
        configureView()
    }
    
    private func configureView() {
        configureCellViews()
        symbolСells.forEach(addSubview)
        bindModel()
    }
    
    private func configureCellViews() {
        symbolСells = [CellView]()
        symbolСells.reserveCapacity(8)
        for index in 0 ..< columns {
            let origin = CGPoint(x: index * 38, y: 0)
            let cell = CellView(origin: origin)
            symbolСells.append(cell)
        }
    }
    
    private func bindModel() {
        for (index, datas) in model.enumerated() {
            symbolСells[index].bindModel(datas)
        }
    }
    
}

