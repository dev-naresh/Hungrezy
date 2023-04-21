//
//  CartTotalView.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 18/04/23.
//

import Cocoa

class CartTotalView : NSView {
    override func draw(_ dirtyRect: NSRect) {
        wantsLayer = true
        layer?.backgroundColor = NSColor.controlAccentColor.withAlphaComponent(0.5).cgColor
        layer?.cornerRadius = 10
    }
    
    lazy var cartTaxesview: CartTaxesView = {
        var view = CartTaxesView()
        view.translatesAutoresizingMaskIntoConstraints = false
//        addSubview(view)
        return view
    }()
    
    lazy var cartTotalLabel: NSTextField = {
        var field = NSTextField(labelWithString: "Cart Total")
        let fontDescriptor = NSFontDescriptor(name: "Optima", size: 14)
        field.font = NSFont(descriptor: fontDescriptor, size: 14)
        field.translatesAutoresizingMaskIntoConstraints = false
        addSubview(field)
        return field
    }()
    
    lazy var chargesLabel: NSTextField = {
        var field = NSTextField(labelWithString: "Taxes and Charges")
        let fontDescriptor = NSFontDescriptor(name: "Optima", size: 12)
        field.font = NSFont(descriptor: fontDescriptor, size: 14)
        field.translatesAutoresizingMaskIntoConstraints = false
        addSubview(field)
        return field
    }()
    
    lazy var grandTotalLabel: NSTextField = {
        var field = NSTextField(labelWithString: "Grand Total")
        let fontDescriptor = NSFontDescriptor(name: "Optima", size: 14)
        field.font = NSFont(descriptor: fontDescriptor, size: 14)
        field.translatesAutoresizingMaskIntoConstraints = false
        addSubview(field)
        return field
    }()
    
    lazy var cartTotalField: NSTextField = {
        var field = NSTextField(labelWithString: "₹ 0.00")
        let fontDescriptor = NSFontDescriptor(name: "Optima", size: 14)
        field.font = NSFont(descriptor: fontDescriptor, size: 14)
        field.translatesAutoresizingMaskIntoConstraints = false
        addSubview(field)
        return field
    }()
    
    lazy var chargesField: NSTextField = {
        var field = NSTextField(labelWithString: "₹ 0.00")
        let fontDescriptor = NSFontDescriptor(name: "Optima", size: 12)
        field.font = NSFont(descriptor: fontDescriptor, size: 14)
        field.translatesAutoresizingMaskIntoConstraints = false
        addSubview(field)
        return field
    }()
    
    lazy var grandTotalField: NSTextField = {
        var field = NSTextField(labelWithString: "₹ 0.00")
        let fontDescriptor = NSFontDescriptor(name: "Optima", size: 14)
        field.font = NSFont(descriptor: fontDescriptor, size: 14)
        field.translatesAutoresizingMaskIntoConstraints = false
        addSubview(field)
        return field
    }()
    
    lazy var infoButton: NSButton = {
        var view = NSButton()
        view.image = NSImage(systemSymbolName: "info.circle", accessibilityDescription: nil)
        view.cell?.isBordered = false
        view.target = self
        view.action = #selector(showTaxesView)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }()
    
    func addChargeValues(cartTotal: Int, tax: Int, packingFee: Int, deliveryFee: Int) {
        cartTotalField.stringValue = "₹ \(cartTotal).00"
        chargesField.stringValue = "₹ \(tax + packingFee + deliveryFee).00"
        grandTotalField.stringValue = "₹ \(cartTotal + tax + packingFee + deliveryFee).00"
        
        cartTaxesview.addChargeValues(tax: tax, packingFee: packingFee, deliveryFee: deliveryFee)
    }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        NSLayoutConstraint.activate([
            cartTotalLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            cartTotalLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
//            cartTotalLabel.trailingAnchor.constraint(equalTo: cartTotalField.leadingAnchor),
            cartTotalLabel.bottomAnchor.constraint(equalTo: chargesLabel.topAnchor, constant: -10),
            
            chargesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            chargesLabel.bottomAnchor.constraint(equalTo: grandTotalLabel.topAnchor, constant: -10),
            chargesLabel.trailingAnchor.constraint(equalTo: infoButton.leadingAnchor, constant: -10),
            
            infoButton.topAnchor.constraint(equalTo: chargesLabel.topAnchor),
            infoButton.bottomAnchor.constraint(equalTo: chargesLabel.bottomAnchor),
            
            grandTotalLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            grandTotalLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            
            cartTotalField.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            cartTotalField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            cartTotalField.bottomAnchor.constraint(equalTo: chargesField.topAnchor, constant: -10),
            
            chargesField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            chargesField.bottomAnchor.constraint(equalTo: grandTotalField.topAnchor, constant: -10),
            
            grandTotalField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            grandTotalField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
        ])
    }
    
    @objc func showTaxesView(sender: NSButton) {
        let popover = NSPopover()
        let viewController = NSViewController()
        viewController.view = cartTaxesview
        popover.contentViewController = viewController
        popover.behavior = .transient
        popover.animates = true
        popover.show(relativeTo: sender.bounds, of: sender, preferredEdge: .minY)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
