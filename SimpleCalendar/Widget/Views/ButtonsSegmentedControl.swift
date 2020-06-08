//
//  ButtonsSegmentedControl.swift
//  Widget
//
//  Created by Dzhek on 05.06.2020.
//  Copyright © 2020 Dzhek. All rights reserved.
//

import Cocoa

final class ButtonsSegmentedControl: NSSegmentedControl {

    private let size = CGSize(width: 148, height: 26)
    private let todayLabel: String = "Today"
    
    // MARK: -
    
    convenience init(origin: CGPoint) {
        self.init(frame: NSRect.zero)
        self.frame = NSRect(origin: origin, size: size)
        configureView()
    }
    
    private func configureView() {
        segmentCount = 3
        segmentStyle = .separated
        segmentDistribution = .fit
        focusRingType = .none
        font = NSFont.controls
        
        setupFirstSegment()
        setupSecondSegment()
        setupThirdSegment()
    }
    
    private func setupFirstSegment() {
        setWidth(22, forSegment: 0)
        guard let image = NSImage(named: NSImage.goBackTemplateName as NSImage.Name)
            else { return }
        image.size = NSSize(width: image.size.width * 0.75,
                            height: image.size.height * 0.75)
        image.alignmentRect = NSRect(x: 0, y: 0,
                                     width: image.size.width,
                                     height: image.size.height)
        setImage(image, forSegment: 0)
    
    }
    
    private func setupSecondSegment() {
        setWidth(98, forSegment: 1)
        setLabel(todayLabel, forSegment: 1)
    }
    
    private func setupThirdSegment() {
        setWidth(22, forSegment: 2)
        guard let image = NSImage(named: NSImage.goForwardTemplateName as NSImage.Name)
            else { return }
        image.size = NSSize(width: image.size.width * 0.75,
                            height: image.size.height * 0.75)
        image.alignmentRect = NSRect(x: 0, y: 0,
                                     width: image.size.width,
                                     height: image.size.height)
        setImage(image, forSegment: 2)
    
    }
    
}
