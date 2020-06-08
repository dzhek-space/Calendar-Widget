//
//  AnimationNSView.swift
//  Widget
//
//  Created by Dzhek on 08.06.2020.
//  Copyright © 2020 Dzhek. All rights reserved.
//

import Cocoa

extension NSView {
    
    class func animate(withDuration duration: TimeInterval,
                            delay: TimeInterval = 0.0,
                            timingFunction: CAMediaTimingFunction = CAMediaTimingFunction(name: .easeInEaseOut),
                            animations: @escaping () -> Void,
                            completion: (() -> Void)? = nil)
    {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            NSAnimationContext.runAnimationGroup({ (context) in
                context.duration = duration
                context.allowsImplicitAnimation = true
                context.timingFunction = timingFunction
                animations()
            }, completionHandler: completion)
        }
    }
    
}
