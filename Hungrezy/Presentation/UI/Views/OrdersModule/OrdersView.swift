//
//  OrdersView.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 07/04/23.
//

import AppKit

class OrdersView: NSView {
    var user: User?
    
    lazy var alertTextLabel: NSTextField = {
        var textLabel = NSTextField(labelWithString: "Orders View Comming Soon")
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textLabel)
        return textLabel
    }()
    
    init(user: User?) {
        super.init(frame: NSZeroRect)
        self.user = user
        
        NSLayoutConstraint.activate([
            alertTextLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            alertTextLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
