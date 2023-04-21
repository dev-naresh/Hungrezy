//
//  AuthenticationPageImageView.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 30/03/23.
//

import Cocoa

class AuthenticationPageImageView: NSView {
    lazy var image: NSImageView = {
        var imageView = NSImageView()
        imageView.image = NSImage(named: "signup1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        return imageView
    }()
    
    lazy var quote: NSTextField = {
        var textField = NSTextField()
        textField.stringValue = "Straight out of the kitchen to your doorstep"
        textField.font = NSFont(name: "Comic Sans MS", size: 15)
        textField.isBordered = false
        textField.isEditable = false
        textField.isSelectable = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textField)
        return textField
    }()
    
    override func draw(_ dirtyRect: NSRect) {
        layer?.backgroundColor = NSColor.controlBackgroundColor.cgColor
    }
    
//    var timer: Timer?
//
//    override func viewDidMoveToSuperview() {
//        super.viewDidMoveToSuperview()
//        let images = [NSImage(named: "signup2"), NSImage(named: "signup3"), NSImage(named: "signup1")]
//        let quotes = ["Straight out of the kitchen to your doorstep", "Hot, tasty food to your destination in 20mins", "Filling your tummy on time is what we care about"]
//        var n = 1
//
//        timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { [weak self] timer in
//            print("Timer fired!")
//
//            self?.image.image = images[n]
//            self?.quote.stringValue = quotes[n]
//            self?.window?.contentView = nil
//            n += 1
//            if n > 2 {
//                n = 0
//            }
//        }
//    }
//
//    override func willRemoveSubview(_ subview: NSView) {
//        super.willRemoveSubview(subview)
//        timer = nil
//    }
        
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        wantsLayer = true

        NSLayoutConstraint.activate([
//            image.topAnchor.constraint(equalTo: topAnchor),
//            image.bottomAnchor.constraint(equalTo: bottomAnchor),
//            image.leadingAnchor.constraint(equalTo: leadingAnchor),
//            image.trailingAnchor.constraint(equalTo: trailingAnchor),
            image.centerXAnchor.constraint(equalTo: centerXAnchor),
            image.centerYAnchor.constraint(equalTo: centerYAnchor),
            image.heightAnchor.constraint(lessThanOrEqualToConstant: 400),
            image.widthAnchor.constraint(lessThanOrEqualToConstant: 400),
            
            quote.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 20),
            quote.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
