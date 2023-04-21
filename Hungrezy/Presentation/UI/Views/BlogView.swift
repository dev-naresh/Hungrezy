//
//  BlogView.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 07/04/23.
//

import AppKit

class BlogView: NSView {
    lazy var alertTextLabel: NSTextField = {
        var textLabel = NSTextField(labelWithString: "Blogs Comming Soon")
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textLabel)
        return textLabel
    }()
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        NSLayoutConstraint.activate([
            alertTextLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            alertTextLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
