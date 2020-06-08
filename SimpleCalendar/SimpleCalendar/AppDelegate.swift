//
//  AppDelegate.swift
//  SimpleCalendar
//
//  Created by Dzhek on 04.06.2020.
//  Copyright © 2020 Dzhek. All rights reserved.
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        let contentView = WelcomeView()
        let screenRect = NSRect(x: 0, y: 0, width: 320, height: 568)

        window = NSWindow(contentRect: screenRect,
                          styleMask: [.titled, .closable, .miniaturizable],
                          backing: .buffered,
                          defer: false)
        window.center()
        window.isMovable = true
        window.isMovableByWindowBackground = true
        window.titlebarAppearsTransparent = true
        window.setFrameAutosaveName("Main Simple Сalendar App Window")
        window.contentView = NSHostingView(rootView: contentView)
        window.makeKeyAndOrderFront(nil)
        
    }

}
