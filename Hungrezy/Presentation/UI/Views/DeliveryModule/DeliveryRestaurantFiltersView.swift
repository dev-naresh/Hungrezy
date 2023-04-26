//
//  DeliveryFiltersView.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 11/04/23.
//

import Cocoa

class DeliveryRestaurantFiltersView : NSView {
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        wantsLayer = true
        layer?.backgroundColor = NSColor.controlBackgroundColor.cgColor
        layer?.cornerRadius = 10
    }
    
    lazy var locationDropDown: NSPopUpButton = {
        var dropDown = NSPopUpButton()
        dropDown.bezelStyle = .inline
        dropDown.alignment = .center
        dropDown.imagePosition = .imageLeft
//        dropDown.imageScaling = .scaleProportionallyUpOrDown
        dropDown.image = NSImage(systemSymbolName: "mappin.circle", accessibilityDescription: nil)
        dropDown.font = NSFont(name: "Times New Roman", size: 15)
        let item = NSMenuItem(title: "Chennai", action: nil, keyEquivalent: "")
        item.image = NSImage(systemSymbolName: "building.2", accessibilityDescription: nil)
        dropDown.menu?.addItem(item)
        let item2 = NSMenuItem(title: "Bangalore", action: nil, keyEquivalent: "")
        item2.image = NSImage(systemSymbolName: "building", accessibilityDescription: nil)
        dropDown.menu?.addItem(item2)
        let item3 = NSMenuItem(title: "Coimbatore", action: nil, keyEquivalent: "")
        item3.image = NSImage(systemSymbolName: "building.columns", accessibilityDescription: nil)
        dropDown.menu?.addItem(item3)
        dropDown.select(item)
        dropDown.target = self
        dropDown.action = #selector(changeCityAction)
        dropDown.translatesAutoresizingMaskIntoConstraints = false
        addSubview(dropDown)
        return dropDown
    }()

    lazy var filtersLabel: NSTextField = {
        var textField = NSTextField(labelWithString: "Filters")
        let fontDescriptor = NSFontDescriptor(name: "Cochin", size: 21).withSymbolicTraits(.bold)
        textField.font = NSFont(descriptor: fontDescriptor, size: 21)
        textField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textField)
        return textField
    }()
    
    lazy var starRatingFilterLabel: NSTextField = {
        var textField = NSTextField(labelWithString: "By star rating: Any")
        textField.font = NSFont(name: "Optima", size: 14)
        textField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textField)
        return textField
    }()
        
    lazy var ratingsFilter: NSSlider = {
        var view = NSSlider()
        view.sliderType = .linear
        view.altIncrementValue = 0.5
        view.allowsTickMarkValuesOnly = true
        view.numberOfTickMarks = 4
        view.tickMarkPosition = .below
        view.target = self
        view.action = #selector(filterAction)
        view.minValue = 3
        view.maxValue = 4.5
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }()
    
    lazy var pureVegCheckBox: NSButton = {
        var button = NSButton()
        button.setButtonType(.switch)
        button.font = NSFont(name: "Optima", size: 14)
        button.title = "Pure Vegetarian"
        button.target = self
        button.action = #selector(filterAction)
        button.translatesAutoresizingMaskIntoConstraints = false
        addSubview(button)
        return button
    }()
    
    lazy var cuisinesLabel: NSTextField = {
        var textField = NSTextField(labelWithString: "Cuisines")
        let fontDescriptor = NSFontDescriptor(name: "Cochin", size: 21).withSymbolicTraits(.bold)
        textField.font = NSFont(descriptor: fontDescriptor, size: 21)
        textField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textField)
        return textField
    }()
    
    lazy var indianCuisineCheckBox: NSButton = {
        var button = NSButton()
        button.setButtonType(.switch)
        button.font = NSFont(name: "Optima", size: 14)
        button.title = "Indian"
        button.target = self
        button.action = #selector(filterAction)
        button.translatesAutoresizingMaskIntoConstraints = false
        addSubview(button)
        return button
    }()
    
    lazy var italianCuisineCheckBox: NSButton = {
        var button = NSButton()
        button.setButtonType(.switch)
        button.font = NSFont(name: "Optima", size: 14)
        button.title = "Italian"
        button.target = self
        button.action = #selector(filterAction)
        button.translatesAutoresizingMaskIntoConstraints = false
        addSubview(button)
        return button
    }()
    
    lazy var chineseCuisineCheckBox: NSButton = {
        var button = NSButton()
        button.setButtonType(.switch)
        button.font = NSFont(name: "Optima", size: 14)
        button.title = "Chinese"
        button.target = self
        button.action = #selector(filterAction)
        button.translatesAutoresizingMaskIntoConstraints = false
        addSubview(button)
        return button
    }()
    
    lazy var continentalCuisineCheckBox: NSButton = {
        var button = NSButton()
        button.setButtonType(.switch)
        button.font = NSFont(name: "Optima", size: 14)
        button.title = "Continental"
        button.target = self
        button.action = #selector(filterAction)
        button.translatesAutoresizingMaskIntoConstraints = false
        addSubview(button)
        return button
    }()
    
    lazy var biryaniCuisineCheckBox: NSButton = {
        var button = NSButton()
        button.setButtonType(.switch)
        button.font = NSFont(name: "Optima", size: 14)
        button.title = "Biryani"
        button.target = self
        button.action = #selector(filterAction)
        button.translatesAutoresizingMaskIntoConstraints = false
        addSubview(button)
        return button
    }()
    
    lazy var chettinadCuisineCheckBox: NSButton = {
        var button = NSButton()
        button.setButtonType(.switch)
        button.font = NSFont(name: "Optima", size: 14)
        button.title = "Chettinad"
        button.target = self
        button.action = #selector(filterAction)
        button.translatesAutoresizingMaskIntoConstraints = false
        addSubview(button)
        return button
    }()
    
    lazy var streetFoodCuisineCheckBox: NSButton = {
        var button = NSButton()
        button.setButtonType(.switch)
        button.font = NSFont(name: "Optima", size: 14)
        button.title = "Street food"
        button.target = self
        button.action = #selector(filterAction)
        button.translatesAutoresizingMaskIntoConstraints = false
        addSubview(button)
        return button
    }()
    
    lazy var sortByLabel: NSTextField = {
        var textField = NSTextField(labelWithString: "Sort by")
        let fontDescriptor = NSFontDescriptor(name: "Cochin", size: 21).withSymbolicTraits(.bold)
        textField.font = NSFont(descriptor: fontDescriptor, size: 21)
        textField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textField)
        return textField
    }()
    
//    lazy var noSort: NSButton = {
//        var button = NSButton()
//        button.setButtonType(.radio)
//        button.font = NSFont(name: "Optima", size: 14)
//        button.title = "None"
//        button.target = self
//        button.action = #selector(filterAction)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        addSubview(button)
//        return button
//    }()
    
    lazy var ratingsHighToLow: NSButton = {
        var button = NSButton()
        button.setButtonType(.radio)
        button.font = NSFont(name: "Optima", size: 14)
        button.title = "Rating: High to Low"
        button.target = self
        button.action = #selector(filterAction)
        button.translatesAutoresizingMaskIntoConstraints = false
        addSubview(button)
        return button
    }()
    
    lazy var priceLowToHigh: NSButton = {
        var button = NSButton()
        button.setButtonType(.radio)
        button.font = NSFont(name: "Optima", size: 14)
        button.title = "Price: Low to High"
        button.target = self
        button.action = #selector(filterAction)
        button.translatesAutoresizingMaskIntoConstraints = false
        addSubview(button)
        return button
    }()
    
    lazy var priceHighToLow: NSButton = {
        var button = NSButton()
        button.setButtonType(.radio)
        button.font = NSFont(name: "Optima", size: 14)
        button.title = "Price: High to Low"
        button.target = self
        button.action = #selector(filterAction)
        button.translatesAutoresizingMaskIntoConstraints = false
        addSubview(button)
        return button
    }()
    
    
    
    
    
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        NSLayoutConstraint.activate([
            locationDropDown.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            locationDropDown.centerXAnchor.constraint(equalTo: centerXAnchor),
            locationDropDown.bottomAnchor.constraint(equalTo: filtersLabel.topAnchor, constant: -20),
            locationDropDown.heightAnchor.constraint(equalToConstant: 25),
            locationDropDown.widthAnchor.constraint(equalToConstant: 120),
            
            filtersLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            filtersLabel.bottomAnchor.constraint(equalTo: starRatingFilterLabel.topAnchor, constant: -10),
            
            starRatingFilterLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            starRatingFilterLabel.bottomAnchor.constraint(equalTo: ratingsFilter.topAnchor, constant: -5),
            
            ratingsFilter.bottomAnchor.constraint(equalTo: pureVegCheckBox.topAnchor, constant: -10),
            ratingsFilter.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            ratingsFilter.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            pureVegCheckBox.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            pureVegCheckBox.bottomAnchor.constraint(equalTo: cuisinesLabel.topAnchor, constant: -20),
            
            cuisinesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            cuisinesLabel.bottomAnchor.constraint(equalTo: chettinadCuisineCheckBox.topAnchor, constant: -10),
            
            chettinadCuisineCheckBox.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            chettinadCuisineCheckBox.bottomAnchor.constraint(equalTo: chineseCuisineCheckBox.topAnchor, constant: -10),
            
            chineseCuisineCheckBox.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            chineseCuisineCheckBox.bottomAnchor.constraint(equalTo: continentalCuisineCheckBox.topAnchor, constant: -10),
            
            continentalCuisineCheckBox.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            continentalCuisineCheckBox.bottomAnchor.constraint(equalTo: indianCuisineCheckBox.topAnchor, constant: -10),
            
            indianCuisineCheckBox.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            indianCuisineCheckBox.bottomAnchor.constraint(equalTo: italianCuisineCheckBox.topAnchor, constant: -10),
            
            italianCuisineCheckBox.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            italianCuisineCheckBox.bottomAnchor.constraint(equalTo: biryaniCuisineCheckBox.topAnchor, constant: -10),
            
            biryaniCuisineCheckBox.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            biryaniCuisineCheckBox.bottomAnchor.constraint(equalTo: streetFoodCuisineCheckBox.topAnchor, constant: -10),
            
            streetFoodCuisineCheckBox.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            streetFoodCuisineCheckBox.bottomAnchor.constraint(equalTo: sortByLabel.topAnchor, constant: -20),
            
            sortByLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            sortByLabel.bottomAnchor.constraint(equalTo: ratingsHighToLow.topAnchor, constant: -10),
            
//            noSort.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
//            noSort.bottomAnchor.constraint(equalTo: ratingsHighToLow.topAnchor, constant: -10),
            
            ratingsHighToLow.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            ratingsHighToLow.bottomAnchor.constraint(equalTo: priceLowToHigh.topAnchor, constant: -10),
            
            priceLowToHigh.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            priceLowToHigh.bottomAnchor.constraint(equalTo: priceHighToLow.topAnchor, constant: -10),
            
            priceHighToLow.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
//            priceHighToLow.bottomAnchor.constraint(equalTo: priceHighToLow.topAnchor, constant: -10),
            
            
            
            widthAnchor.constraint(lessThanOrEqualToConstant: 200),
            widthAnchor.constraint(greaterThanOrEqualToConstant: 150),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func filterAction() {
        
        var starRatingsAbove: Float = 0
        
        switch ratingsFilter.doubleValue {
        case 3.5:
            starRatingsAbove = 3.5
        case 4.0:
            starRatingsAbove = 4.0
        case 4.5:
            starRatingsAbove = 4.5
        default:
            break
        }
        
        (superview as? DeliveryView)?.presenter.applyFilters(starRatingAbove: starRatingsAbove, isPureVegeterian: pureVegCheckBox.state == .on, isChettinad: chettinadCuisineCheckBox.state == .on, isChinese: chineseCuisineCheckBox.state == .on, isContinental: continentalCuisineCheckBox.state == .on, isIndian: indianCuisineCheckBox.state == .on, isItalian: italianCuisineCheckBox.state == .on, isBiryani: biryaniCuisineCheckBox.state == .on, isStreetFood: streetFoodCuisineCheckBox.state == .on)
        
        if ratingsHighToLow.state == .on {
            (superview as? DeliveryView)?.presenter.applySorting(by: .RatingHighToLow)
        } else if priceLowToHigh.state == .on {
            (superview as? DeliveryView)?.presenter.applySorting(by: .PriceLowToHigh)
        } else if priceHighToLow.state == .on {
            (superview as? DeliveryView)?.presenter.applySorting(by: .PriceHighToLow)
        }
    }
    
    @objc func changeCityAction() {
        
        if ratingsFilter.doubleValue == 3.0 {
            starRatingFilterLabel.stringValue = "By star rating: Any"
        } else {
            starRatingFilterLabel.stringValue = "By star rating: \(ratingsFilter.doubleValue)+"
        }
        
        var filters: [String] = []
        
        filters.append("city=\"\(locationDropDown.title)\"")
        filters.append("(diningType=0 or diningType=2)")
        
        (superview as? DeliveryView)?.presenter.getRestaurantsList(filters: filters)
    }
}
