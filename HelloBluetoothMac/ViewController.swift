//
//  ViewController.swift
//  HelloBluetoothMac
//
//  Created by Lucas Derraugh on 2/4/18.
//  Copyright © 2018 Nebojsa Petrovic. All rights reserved.
//

import Cocoa

final class ViewController: NSViewController {
    
    private var simpleBluetoothIO: SimpleBluetoothIO!
    
    override func loadView() {
        let view = NSView(frame: NSMakeRect(0, 0, 360, 230))
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.black.cgColor
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        simpleBluetoothIO = SimpleBluetoothIO(serviceUUID: "19B10010-E8F2-537E-4F6C-D104768A1214", delegate: self)
        
        let button = NSButton(title: "LED", target: self, action: #selector(buttonPressed(_:)))
        button.sendAction(on: [.leftMouseDown, .leftMouseUp])
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func buttonPressed(_ sender: NSButton) {
        let value = Int8(NSEvent.pressedMouseButtons)
        simpleBluetoothIO.writeValue(value: value)
    }
}

extension ViewController: SimpleBluetoothIODelegate {
    func simpleBluetoothIO(simpleBluetoothIO: SimpleBluetoothIO, didReceiveValue value: Int8) {
        view.layer?.backgroundColor = value > 0 ? NSColor.yellow.cgColor : NSColor.black.cgColor
    }
}
