//
//  AppDelegate.swift
//  TouchBarDemo
//
//  Created by 蓝潇枫 on 2017/2/14.
//  Copyright © 2017年 蓝潇枫. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var windowController:NSWindowController?
    

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        let windowController = WindowController()
        windowController.showWindow(self)
        self.windowController = windowController
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

