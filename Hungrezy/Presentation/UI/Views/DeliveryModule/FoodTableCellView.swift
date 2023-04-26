//
//  FoodTableCellView.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 17/04/23.
//

import AppKit

protocol FoodModelContract {
    var foodID: String { get }
    var foodName: String { get }
    var foodDescription: String { get }
    var priceTag: Int { get }
    var foodImageUrl: String { get }
    var foodImage: NSImage? { get }
    var ratings: Float { get }
    var cuisine: String { get }
    var isVegetarian: Bool { get }
    var quantity: Int { get set }
}

class FoodModel: FoodModelContract {
    var foodID: String
    var foodName: String
    var foodDescription: String
    var priceTag: Int
    var foodImageUrl: String
    var foodImage: NSImage?
    var ratings: Float
    var cuisine: String
    var isVegetarian: Bool
    var quantity: Int
    
    init(foodID: String, foodName: String, foodDescription: String, priceTag: Int, foodImageUrl: String, foodImage: NSImage?, ratings: Float, cuisine: String, isVegetarian: Bool, quantity: Int) {
        self.foodID = foodID
        self.foodName = foodName
        self.foodDescription = foodDescription
        self.priceTag = priceTag
        self.foodImageUrl = foodImageUrl
        self.foodImage = foodImage
        self.ratings = ratings
        self.cuisine = cuisine
        self.isVegetarian = isVegetarian
        self.quantity = quantity
    }
}

//func addValues(food: Food, foodImage: NSImage, foodListView: FoodListView, quantity: Int) {
//    self.food = food
//    self.foodListView = foodListView
//
//    self.foodName.stringValue = food.name
//    self.foodDescription.stringValue = food.description
//    self.priceTag.stringValue = "₹ \(food.price).00"
//    self.ratingField.stringValue = String(format: "%.1f", food.ratings)
//    self.image.image = foodImage
//
//    if food.ratings == 0.0 {
//        self.ratingsView.layer?.backgroundColor = .init(gray: 0.5, alpha: 1)
//        self.ratingField.stringValue = "--"
//    } else {
//        self.ratingsView.layer?.backgroundColor = .init(red: CGFloat(5 - food.ratings)/3, green: CGFloat(food.ratings - 2)/3, blue: 0, alpha: 1)
//        self.ratingField.stringValue = "\(food.ratings)"
//    }
//
//    if food.isVegetarian {
//        vegOrNonVegMark.contentTintColor = .systemGreen
//    } else {
//        vegOrNonVegMark.contentTintColor = .red
//    }
//
//    if quantity == 0 {
//        self.minusButton.isEnabled = false
//        self.plusButton.isEnabled = true
//    } else if quantity == 5 {
//        self.minusButton.isEnabled = true
//        self.plusButton.isEnabled = false
//    } else {
//        self.minusButton.isEnabled = true
//        self.plusButton.isEnabled = true
//    }
//
//    self.quantityLabel.integerValue = quantity
//}

class FoodTableCellView : NSTableCellView {
    weak var foodListView: FoodListView?
//    var food: Food? = nil
    var model: FoodModelContract? {
        didSet {
            if let model = model {
                self.foodName.stringValue = model.foodName
                self.foodDescription.stringValue = model.foodDescription
                self.priceTag.stringValue = "₹ \(model.priceTag).00"
                self.ratingField.stringValue = String(format: "%.1f", model.ratings)
                self.image.image = model.foodImage
                
                if model.ratings == 0.0 {
                    self.ratingsView.layer?.backgroundColor = .init(gray: 0.5, alpha: 1)
                    self.ratingField.stringValue = "--"
                } else {
                    self.ratingsView.layer?.backgroundColor = .init(red: CGFloat(5 - model.ratings)/3, green: CGFloat(model.ratings - 2)/3, blue: 0, alpha: 1)
                    self.ratingField.stringValue = "\(model.ratings)"
                }
                
                if model.isVegetarian {
                    vegOrNonVegMark.contentTintColor = .systemGreen
                } else {
                    vegOrNonVegMark.contentTintColor = .red
                }

                if model.quantity == 0 {
                    self.minusButton.isEnabled = false
                    self.plusButton.isEnabled = true
                } else if model.quantity == 5 {
                    self.minusButton.isEnabled = true
                    self.plusButton.isEnabled = false
                } else {
                    self.minusButton.isEnabled = true
                    self.plusButton.isEnabled = true
                }

                self.quantityLabel.integerValue = model.quantity
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
    
    lazy var foodDescription: NSTextField = {
        let view = NSTextField()
        view.isEditable = false
        view.isBordered = false
        view.backgroundColor = .clear
        view.alignment = .justified
        view.font = NSFont(name: "Georgia", size: 13)
        view.maximumNumberOfLines = 3
        view.lineBreakMode = .byWordWrapping
        view.cell?.truncatesLastVisibleLine = true
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
        let fontDescriptor = NSFontDescriptor(name: "Optima", size: 16).withSymbolicTraits(.bold)
        view.font = NSFont(descriptor: fontDescriptor, size: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }()
    
    lazy var vegOrNonVegMark: NSImageView = {
        let view = NSImageView()
        view.image = NSImage(systemSymbolName: "dot.square", accessibilityDescription: nil)
        view.imageScaling = .scaleProportionallyUpOrDown
        view.image?.size.height = 16
        view.image?.size.width = 16
        view.image?.resizingMode = .stretch
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }()
    
    lazy var ratingsView: NSView = {
        var ratingsView = NSView()
        ratingsView.wantsLayer = true
        ratingsView.layer?.backgroundColor = NSColor.red.cgColor
        ratingsView.layer?.cornerRadius = 3
        ratingsView.addSubview(ratingField)
        ratingsView.addSubview(starImage)
        
        NSLayoutConstraint.activate([
//            starImage.topAnchor.constraint(equalTo: ratingsView.topAnchor, constant: 5),
//            starImage.bottomAnchor.constraint(equalTo: ratingsView.bottomAnchor, constant: -5),
            starImage.trailingAnchor.constraint(equalTo: ratingsView.trailingAnchor, constant: -3),
            
            ratingField.leadingAnchor.constraint(equalTo: ratingsView.leadingAnchor, constant: 4),
//            ratingField.topAnchor.constraint(equalTo: ratingsView.topAnchor, constant: 3),
//            ratingField.bottomAnchor.constraint(equalTo: ratingsView.bottomAnchor, constant: -3),
            ratingField.trailingAnchor.constraint(equalTo: starImage.leadingAnchor, constant: -2),
            
            starImage.centerYAnchor.constraint(equalTo: ratingsView.centerYAnchor),
            ratingField.centerYAnchor.constraint(equalTo: ratingsView.centerYAnchor),
            
            starImage.heightAnchor.constraint(equalToConstant: 13),
            starImage.widthAnchor.constraint(equalToConstant: 13),
        ])
        
        ratingsView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(ratingsView)
        return ratingsView
    }()
    
    lazy var ratingField: NSTextField = {
        var field = NSTextField(labelWithString: "2.4")
//        let fontDescriptor = NSFontDescriptor(name: "Palatino", size: 11).withSymbolicTraits(.bold)
        field.textColor = .white
        field.font = .boldSystemFont(ofSize: 12)
        field.translatesAutoresizingMaskIntoConstraints = false
        addSubview(field)
        return field
    }()
    
    lazy var starImage: NSImageView = {
        var imageView = NSImageView()
        imageView.image = NSImage(systemSymbolName: "star.fill", accessibilityDescription: nil)
        imageView.image?.size = NSSize(width: 2, height: 2)
        imageView.contentTintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        return imageView
    }()
    
    lazy var quantityStepper: NSView = {
        var view = NSView()
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.controlAccentColor.cgColor
        view.layer?.cornerRadius = 5
        view.addSubview(plusButton)
        view.addSubview(minusButton)
        view.addSubview(quantityLabel)
        
        NSLayoutConstraint.activate([
            minusButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            minusButton.topAnchor.constraint(equalTo: view.topAnchor),
            minusButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            minusButton.trailingAnchor.constraint(equalTo: quantityLabel.leadingAnchor),
            quantityLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 3),
            quantityLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -3),
            
            quantityLabel.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor),
            plusButton.topAnchor.constraint(equalTo: view.topAnchor),
            plusButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            plusButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            quantityLabel.widthAnchor.constraint(equalToConstant: 20),
            minusButton.widthAnchor.constraint(equalTo: quantityLabel.widthAnchor),
            quantityLabel.widthAnchor.constraint(equalTo: plusButton.widthAnchor),
            
            view.heightAnchor.constraint(equalToConstant: 23)
        ])
        
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }()
    
    lazy var plusButton: NSButton = {
        var view = NSButton()
        view.image = NSImage(systemSymbolName: "plus", accessibilityDescription: nil)
        view.contentTintColor = .white
        view.isBordered = false
        view.target = self
        view.action = #selector(addQuantity)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }()
    
    lazy var minusButton: NSButton = {
        var view = NSButton()
        view.image = NSImage(systemSymbolName: "minus", accessibilityDescription: nil)
        view.contentTintColor = .white
        view.isEnabled = false
        view.isBordered = false
        view.target = self
        view.action = #selector(removeQuantity)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }()
    
    lazy var quantityLabel: NSTextField = {
        var view = NSTextField(labelWithString: "0")
        view.textColor = .white
        view.alignment = .center
        view.bezelStyle = .roundedBezel
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }()
    
    lazy var image: NSImageView = {
        let view = NSImageView()
        view.imageScaling = .scaleProportionallyUpOrDown
        view.contentTintColor = .controlAccentColor
        view.image = NSImage(systemSymbolName: "fork.knife.circle", accessibilityDescription: nil)
        view.image?.size = NSSize(width: 100, height: 75)
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
            image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            image.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            image.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            image.heightAnchor.constraint(equalToConstant: 75),
            image.widthAnchor.constraint(equalToConstant: 100),
            
            image.trailingAnchor.constraint(equalTo: foodName.leadingAnchor, constant: -10),
            foodName.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            foodName.bottomAnchor.constraint(equalTo: foodDescription.topAnchor, constant: -7),
            foodName.trailingAnchor.constraint(equalTo: priceTag.leadingAnchor),
            foodName.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor),
            
            foodDescription.leadingAnchor.constraint(equalTo: foodName.leadingAnchor),
            foodDescription.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
//            foodDescription.trailingAnchor.constraint(equalTo: trailingAnchor),
            foodDescription.trailingAnchor.constraint(lessThanOrEqualTo: quantityStepper.leadingAnchor, constant: -10),
//            foodDescription.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor),
            
            ratingsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            ratingsView.topAnchor.constraint(equalTo: foodName.topAnchor),
            ratingsView.bottomAnchor.constraint(equalTo: foodName.bottomAnchor),
            
            vegOrNonVegMark.trailingAnchor.constraint(equalTo: ratingsView.leadingAnchor, constant: -10),
            vegOrNonVegMark.topAnchor.constraint(equalTo: foodName.topAnchor),
            vegOrNonVegMark.bottomAnchor.constraint(equalTo: foodName.bottomAnchor),
            
            vegOrNonVegMark.heightAnchor.constraint(equalToConstant: 20),
            vegOrNonVegMark.widthAnchor.constraint(equalToConstant: 20),
            
            priceTag.trailingAnchor.constraint(equalTo: vegOrNonVegMark.leadingAnchor, constant: -10),
            priceTag.topAnchor.constraint(equalTo: foodName.topAnchor),
            priceTag.bottomAnchor.constraint(equalTo: foodName.bottomAnchor),
            
            ratingsView.bottomAnchor.constraint(equalTo: quantityStepper.topAnchor, constant: -12),
            quantityStepper.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FoodTableCellView {
    @objc func addQuantity(_ sender: NSButton) {
        quantityLabel.intValue += 1
        if quantityLabel.intValue >= 1 && quantityLabel.intValue <= 5 {
            model?.quantity = Int(quantityLabel.intValue)
            minusButton.isEnabled = true
        }
        if quantityLabel.intValue >= 5 {
            plusButton.isEnabled = false
            quantityLabel.intValue = 5
        }
        foodListView?.updateCart()
    }
    
    @objc func removeQuantity(_ sender: NSButton) {
        plusButton.isEnabled = true
        quantityLabel.intValue -= 1
        model?.quantity = Int(quantityLabel.intValue)
        if quantityLabel.intValue <= 0 {
            minusButton.isEnabled = false
            quantityLabel.intValue = 0
        }
        foodListView?.updateCart()
    }
}
