//
//  DatesBlockView.swift
//  Widget
//
//  Created by Dzhek on 08.06.2020.
//  Copyright © 2020 Dzhek. All rights reserved.
//

import Cocoa

final class DatesBlockView: NSView {
    
    private let size = CGSize(width: 304, height: 124)
    private let rows: Int = 6
    private let columns: Int = 8
    private var model: [CellViewModel]!
    private var dateСells: [CellView]!
    
    // MARK: -
    
    convenience init(origin: CGPoint, model: [CellViewModel]) {
        self.init(frame: NSRect.zero)
        self.frame = NSRect(origin: origin, size: size)
        self.model = model
        self.dateСells = [CellView]()
        self.dateСells.reserveCapacity(48)
        configureView()
    }
    
    private func configureView() {
        confugureDatesBlock()
        dateСells.forEach(addSubview)
        bindModel(model)
    }
    
    private func confugureDatesBlock() {
        dateСells = [CellView]()
        dateСells.reserveCapacity(48)
        for indexRow in 0 ..< rows {
            for indexColumn in 0 ..< columns {
                let origin = CGPoint(x: indexColumn * 38,
                                     y: 113 - (indexRow * 21))
                let cell = CellView(origin: origin)
                dateСells.append(cell)
            }
        }
    }
    
    private func bindModel(_ model: [CellViewModel]) {
        for (index,datas) in model.enumerated() {
            dateСells[index].bindModel(datas)
        }
    }
    
}

// MARK: - Interface

extension DatesBlockView {
    
    func setNewValue(_ model: [CellViewModel], bias: Int) {
        
        NSView.animate(withDuration: 0.175,
                       timingFunction: CAMediaTimingFunction(name: .easeIn),
                       animations: {
                        self.frame.origin.x += CGFloat(6 * bias)
                        self.alphaValue = 0
        }) {
            self.frame.origin.x -= CGFloat(12 * bias)
            self.bindModel(model)
            NSView.animate(withDuration: 0.1,
                           delay: 0.125,
                           timingFunction: CAMediaTimingFunction(name: .easeOut),
                           animations: {
                            self.frame.origin.x += CGFloat(6 * bias)
                            self.alphaValue = 1
            })
        }
    }
    
    func frameTodaysDateCell(_ index: Int) -> NSRect {
        dateСells[index].frame
    }
    
}
