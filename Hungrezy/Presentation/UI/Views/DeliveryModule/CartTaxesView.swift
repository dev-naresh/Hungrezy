//
//  CartTaxesView.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 18/04/23.
//

import Cocoa

class CartTaxesView : NSView {
    lazy var gstLabel: NSTextField = {
        var field = NSTextField(labelWithString: "GST (CGST + SGST)")
        let fontDescriptor = NSFontDescriptor(name: "Optima", size: 14)
        field.font = NSFont(descriptor: fontDescriptor, size: 14)
        field.translatesAutoresizingMaskIntoConstraints = false
        addSubview(field)
        return field
    }()
    
    lazy var packingFeeLabel: NSTextField = {
        var field = NSTextField(labelWithString: "Packing Charges")
        let fontDescriptor = NSFontDescriptor(name: "Optima", size: 12)
        field.font = NSFont(descriptor: fontDescriptor, size: 14)
        field.translatesAutoresizingMaskIntoConstraints = false
        addSubview(field)
        return field
    }()
    
    lazy var deliveryFeeLabel: NSTextField = {
        var field = NSTextField(labelWithString: "Delivery Fee")
        let fontDescriptor = NSFontDescriptor(name: "Optima", size: 14)
        field.font = NSFont(descriptor: fontDescriptor, size: 14)
        field.translatesAutoresizingMaskIntoConstraints = false
        addSubview(field)
        return field
    }()
    
    lazy var gstField: NSTextField = {
        var field = NSTextField(labelWithString: "₹ 0.00")
        let fontDescriptor = NSFontDescriptor(name: "Optima", size: 14)
        field.font = NSFont(descriptor: fontDescriptor, size: 14)
        field.translatesAutoresizingMaskIntoConstraints = false
        addSubview(field)
        return field
    }()
    
    lazy var packingFeeField: NSTextField = {
        var field = NSTextField(labelWithString: "₹ 0.00")
        let fontDescriptor = NSFontDescriptor(name: "Optima", size: 12)
        field.font = NSFont(descriptor: fontDescriptor, size: 14)
        field.translatesAutoresizingMaskIntoConstraints = false
        addSubview(field)
        return field
    }()
    
    lazy var deliveryFeeField: NSTextField = {
        var field = NSTextField(labelWithString: "₹ 0.00")
        let fontDescriptor = NSFontDescriptor(name: "Optima", size: 14)
        field.font = NSFont(descriptor: fontDescriptor, size: 14)
        field.translatesAutoresizingMaskIntoConstraints = false
        addSubview(field)
        return field
    }()
    
    func addChargeValues(tax: Int, packingFee: Int, deliveryFee: Int) {
        gstField.stringValue = "₹ \(tax).00"
        packingFeeField.stringValue = "₹ \(packingFee).00"
        deliveryFeeField.stringValue = "₹ \(deliveryFee).00"
    }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        NSLayoutConstraint.activate([
            gstLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            gstLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            gstLabel.bottomAnchor.constraint(equalTo: packingFeeLabel.topAnchor, constant: -10),
            gstLabel.trailingAnchor.constraint(equalTo: gstField.leadingAnchor, constant: -20),
            
            packingFeeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            packingFeeLabel.bottomAnchor.constraint(equalTo: deliveryFeeLabel.topAnchor, constant: -10),
            
            deliveryFeeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            deliveryFeeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            
            gstField.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            gstField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            gstField.bottomAnchor.constraint(equalTo: packingFeeField.topAnchor, constant: -10),
            
            packingFeeField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            packingFeeField.trailingAnchor.constraint(equalTo: gstField.trailingAnchor),
            packingFeeField.bottomAnchor.constraint(equalTo: deliveryFeeField.topAnchor, constant: -10),
            
            deliveryFeeField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            deliveryFeeField.trailingAnchor.constraint(equalTo: gstField.trailingAnchor),
            deliveryFeeField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
