//
//  AddRestaurantViewController.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 13/04/23.
//

import Cocoa

class AddRestaurantViewController: NSViewController, NSWindowDelegate {
    
//    override func viewDidLoad() {
//        self.view.window?.delegate = self
//    }
    
    override func cancelOperation(_ sender: Any?) {
        self.dismiss(self)
    }
    
    override func keyDown(with event: NSEvent) {
        if event.keyCode == 53 {
            self.dismiss(self)
        } else {
            super.keyDown(with: event)
        }
    }
    
//    func windowShouldClose(_ sender: NSWindow) -> Bool {
//        if sender == self.view.window?.sheetParent {
//            self.dismiss(self)
//            return true
//        }
//        return false
//    }
    
}
