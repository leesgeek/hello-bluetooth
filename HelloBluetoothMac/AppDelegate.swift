//
//  AppDelegate.swift
//  HelloBluetoothMac
//
//  Created by Lucas Derraugh on 2/4/18.
//  Copyright © 2018 Nebojsa Petrovic. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        window.contentViewController = ViewController()
    }
}

