//
//  CartTableCellView.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 18/04/23.
//

import Cocoa

protocol CartModelContract {
    var foodID: String { get }
    var foodName: String { get }
    var priceTag: Int { get }
    var foodImageUrl: String { get }
    var foodImage: NSImage? { get }
    var isVegetarian: Bool { get }
    var quantity: Int { get set }
}

class CartModel: CartModelContract {
    var foodID: String
    var foodName: String
    var priceTag: Int
    var foodImageUrl: String
    var foodImage: NSImage?
    var isVegetarian: Bool
    var quantity: Int
    
    init(foodID: String, foodName: String, priceTag: Int, foodImageUrl: String, foodImage: NSImage?, isVegetarian: Bool, quantity: Int) {
        self.foodID = foodID
        self.foodName = foodName
        self.priceTag = priceTag
        self.foodImageUrl = foodImageUrl
        self.foodImage = foodImage
        self.isVegetarian = isVegetarian
        self.quantity = quantity
    }
}

class CartTableCellView: NSTableCellView {
    var cartModel: CartModelContract? {
        didSet {
            if let model = cartModel {
                foodName.stringValue = model.foodName
                priceTag.stringValue = "₹ \(model.priceTag).00"
                quantityField.stringValue = "Quantity: \(model.quantity)"
                itemTotal.stringValue = "₹ \(model.quantity * model.priceTag).00"
                image.image = model.foodImage
                image.image?.size = NSSize(width: 50, height: 37.5)
                
                if model.isVegetarian {
                    vegOrNonVegMark.contentTintColor = .systemGreen
                } else {
                    vegOrNonVegMark.contentTintColor = .red
                }
            }
        }
    }
    
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
    
    lazy var image: NSImageView = {
        let view = NSImageView()
        view.imageScaling = .scaleProportionallyUpOrDown
        view.contentTintColor = .controlAccentColor
        view.image = NSImage(systemSymbolName: "fork.knife.circle", accessibilityDescription: nil)
        view.image?.size = NSSize(width: 50, height: 37.5)
        view.image?.resizingMode = .stretch
        view.wantsLayer = true
        view.layer?.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }()
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
//            image.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            image.centerYAnchor.constraint(equalTo: centerYAnchor),
            image.trailingAnchor.constraint(equalTo: foodName.leadingAnchor, constant: -10),
            image.trailingAnchor.constraint(equalTo: priceTag.leadingAnchor, constant: -10),
            
//            foodName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
//            priceTag.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
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
