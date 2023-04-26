//
//  OrderListView.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 26/04/23.
//

import Cocoa

class OrdersListView : NSView {
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        wantsLayer = true
        layer?.backgroundColor = NSColor.controlBackgroundColor.cgColor
        layer?.cornerRadius = 10
    }
}
