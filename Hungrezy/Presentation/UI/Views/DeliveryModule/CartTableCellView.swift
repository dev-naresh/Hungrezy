//
//  CartTableCellView.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 18/04/23.
//

import Cocoa

class CartTableCellView: NSTableCellView {
    lazy var foodName: NSTextField = {
        let view = NSTextField()
        view.isEditable = false
        view.isBordered = false
        view.backgroundColor = .clear
        view.lineBreakMode = .byTruncatingTail
        let fontDescriptor = NSFontDescriptor(name: "Cochin", size: 16).withSymbolicTraits(.bold)
        view.font = NSFont(descriptor: fontDescriptor, size: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }()
    
    lazy var priceTag: NSTextField = {
        let view = NSTextField()
        view.isEditable = false
        view.isBordered = false
        view.backgroundColor = .clear
//        view.lineBreakMode = .byTruncatingTail
        let fontDescriptor = NSFontDescriptor(name: "Optima", size: 14)
        view.font = NSFont(descriptor: fontDescriptor, size: 14)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }()
    
    lazy var quantityField: NSTextField = {
        var field = NSTextField(labelWithString: "Quantity: 1")
//        let fontDescriptor = NSFontDescriptor(name: "Palatino", size: 11).withSymbolicTraits(.bold)
//        field.font = .boldSystemFont(ofSize: 12)
        let fontDescriptor = NSFontDescriptor(name: "Optima", size: 14)
        field.font = NSFont(descriptor: fontDescriptor, size: 14)
        field.translatesAutoresizingMaskIntoConstraints = false
        addSubview(field)
        return field
    }()
    
    lazy var itemTotal: NSTextField = {
        let view = NSTextField()
        view.isEditable = false
        view.isBordered = false
        view.backgroundColor = .clear
//        view.lineBreakMode = .byTruncatingTail
        let fontDescriptor = NSFontDescriptor(name: "Optima", size: 14)
        view.font = NSFont(descriptor: fontDescriptor, size: 14)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }()
    
    lazy var vegOrNonVegMark: NSImageView = {
        let view = NSImageView()
        view.image = NSImage(systemSymbolName: "dot.square", accessibilityDescription: nil)
        view.imageScaling = .scaleProportionallyUpOrDown
        view.wantsLayer = true
        view.image?.size.height = 10
        view.image?.size.width = 10
        view.image?.resizingMode = .stretch
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }()
    
    func addValues(food: Food, quantity: Int, cartView: CartView) {
        self.foodName.stringValue = food.name
        self.priceTag.stringValue = "₹ \(food.price).00"
//        self.foodImage.image = foodImage
        self.quantityField.stringValue = "Quantity: \(quantity)"
        self.itemTotal.stringValue = "₹ \(food.price * quantity).00"
        
        if food.isVegetarian {
            vegOrNonVegMark.contentTintColor = .systemGreen
        } else {
            vegOrNonVegMark.contentTintColor = .red
        }
    }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        NSLayoutConstraint.activate([
            foodName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            priceTag.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            quantityField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            itemTotal.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            
            foodName.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -10),
            priceTag.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 10),
            
            quantityField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -10),
            itemTotal.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 10),
            
            
            vegOrNonVegMark.trailingAnchor.constraint(equalTo: quantityField.leadingAnchor, constant: -10),
            vegOrNonVegMark.centerYAnchor.constraint(equalTo: quantityField.centerYAnchor),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
