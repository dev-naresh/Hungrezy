//
//  CustomTextField.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 10/04/23.
//

import Cocoa

class CustomTextField: NSTextField {
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        self.layer?.borderWidth = 5
//        self.layer?.cornerRadius = 5
        self.layer?.borderColor = NSColor.controlColor.cgColor
        font = NSFont(name: "Comic Sans MS", size: 16)
    }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.wantsLayer = true
        self.focusRingType = .none
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
