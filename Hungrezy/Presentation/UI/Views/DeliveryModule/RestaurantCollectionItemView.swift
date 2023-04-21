//
//  RestaurantCollectionItemView.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 11/04/23.
//

import Cocoa

class RestaurantCollectionItemView : NSCollectionViewItem {
    lazy var restaurantName: NSTextField = {
        var field = NSTextField(labelWithString: "Restaurant Name")
        let fontDescriptor = NSFontDescriptor(name: "Optima", size: 16).withSymbolicTraits(.bold)
        field.font = NSFont(descriptor: fontDescriptor, size: 16)
        field.lineBreakMode = .byTruncatingTail
        field.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(field)
        return field
    }()
    
    lazy var cuisines: NSTextField = {
        var field = NSTextField(labelWithString: "Cuisine, Cuisine, Cuisine, Cuisine, Cuisine")
        field.font = NSFont(name: "Optima", size: 13)
        field.lineBreakMode = .byTruncatingTail
        field.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(field)
        return field
    }()
    
    lazy var approximatePrice: NSTextField = {
        var field = NSTextField(labelWithString: "₹1000 for two")
        field.font = NSFont(name: "Optima", size: 13)
        field.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(field)
        return field
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
        view.addSubview(ratingsView)
        return ratingsView
    }()
    
    lazy var ratingField: NSTextField = {
        var field = NSTextField(labelWithString: "0.0")
//        let fontDescriptor = NSFontDescriptor(name: "Palatino", size: 11).withSymbolicTraits(.bold)
        field.textColor = .white
        field.font = .boldSystemFont(ofSize: 12)
        field.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(field)
        return field
    }()
    
    lazy var starImage: NSImageView = {
        var imageView = NSImageView()
        imageView.image = NSImage(systemSymbolName: "star.fill", accessibilityDescription: nil)
        imageView.image?.size = NSSize(width: 2, height: 2)
        imageView.contentTintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        return imageView
    }()
    
    lazy var image: NSImageView = {
        var imageView = NSImageView()
        imageView.image = NSImage(systemSymbolName: "mountain.2.fill", accessibilityDescription: nil)!
        imageView.image?.size = NSSize(width: 270, height: 170)
        imageView.image?.resizingMode = .stretch
        imageView.wantsLayer = true
        imageView.layer?.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        return imageView
    }()
    
    func makeView(restaurantName: String, cuisines: String, ratings: Float, price: Int, image: NSImage) {
        self.restaurantName.stringValue = restaurantName
        self.cuisines.stringValue = cuisines
//        self.ratingField.stringValue = "\(ratings)"
        self.approximatePrice.stringValue = "₹\(price) for two"
        self.image.image = image
        
        if ratings == 0.0 {
            self.ratingsView.layer?.backgroundColor = .init(gray: 0.5, alpha: 1)
            self.ratingField.stringValue = "--"
        } else {
            self.ratingsView.layer?.backgroundColor = .init(red: CGFloat(5 - ratings)/3, green: CGFloat(ratings - 2)/3, blue: 0, alpha: 1)
            self.ratingField.stringValue = "\(ratings)"
        }
        
    }

    override func loadView() {
        view = NSView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 7),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -7),
            image.bottomAnchor.constraint(equalTo: restaurantName.topAnchor, constant: -6),
            
            restaurantName.leadingAnchor.constraint(equalTo: image.leadingAnchor),
            restaurantName.bottomAnchor.constraint(equalTo: cuisines.topAnchor, constant: -2),
            restaurantName.widthAnchor.constraint(equalToConstant: 220),
            
            cuisines.leadingAnchor.constraint(equalTo: image.leadingAnchor),
            cuisines.widthAnchor.constraint(equalToConstant: 180),
            
            image.heightAnchor.constraint(equalToConstant: 170),
            image.widthAnchor.constraint(equalToConstant: 270),
            
            approximatePrice.trailingAnchor.constraint(equalTo: image.trailingAnchor),
            approximatePrice.topAnchor.constraint(equalTo: cuisines.topAnchor),
            approximatePrice.bottomAnchor.constraint(equalTo: cuisines.bottomAnchor),

            ratingsView.topAnchor.constraint(equalTo: restaurantName.topAnchor),
            ratingsView.trailingAnchor.constraint(equalTo: image.trailingAnchor),
            ratingsView.bottomAnchor.constraint(equalTo: restaurantName.bottomAnchor),
            
        ])
    }
}
