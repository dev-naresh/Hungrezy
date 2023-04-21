//
//  AddRestaurantView.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 10/04/23.
//

import Cocoa

class AddRestaurantView : NSView {
    var presenter: AddRestaurantFormPresenterContract
    var backgroundImage: NSImage?
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        formView.layer?.backgroundColor = NSColor.controlBackgroundColor.cgColor
        formView.layer?.cornerRadius = 25
                
        if let backgroundImage = backgroundImage {
            backgroundImage.draw(in: dirtyRect, from: .zero, operation: .sourceOver, fraction: 1.0)
        }
    }
    
//    lazy var backgroundImage: NSImageView = {
//        var imageView = NSImageView()
//        let image = NSImage(named: "restaurant")
//        image?.resizingMode = .tile
//        imageView.image = image
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        addSubview(imageView)
//        return imageView
//    }()
    
    lazy var formView: NSView = {
        var view = NSView()
        view.wantsLayer = true
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }()
    
    lazy var scrollView: NSScrollView = {
        var view = NSScrollView()
        view.documentView = AddRestaurantForm(presenter: presenter, frame: NSRect(x: 0, y: 0, width: 600, height: 660))
        view.wantsLayer = true
        view.contentView.scroll(to: NSPoint(x: 0, y: 260))
        view.translatesAutoresizingMaskIntoConstraints = false
        formView.addSubview(view)
        return view
    }()
    
    lazy var closeButton: NSButton = {
        var button = NSButton()
        button.image = NSImage(systemSymbolName: "xmark.circle.fill", accessibilityDescription: nil)
        button.isBordered = false
        button.bezelColor = .red
        button.contentTintColor = .red
        button.imageScaling = .scaleProportionallyUpOrDown
        button.target = self
        button.action = #selector(closeAddRestaurant)
        button.translatesAutoresizingMaskIntoConstraints = false
        addSubview(button)
        return button
    }()
    
    init(presenter: AddRestaurantFormPresenterContract, frame frameRect: NSRect) {
        self.presenter = presenter
        super.init(frame: frameRect)
        
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 500),
            widthAnchor.constraint(equalToConstant: 675),
            
            formView.heightAnchor.constraint(equalToConstant: 500),
            formView.widthAnchor.constraint(equalToConstant: 675),
            formView.centerXAnchor.constraint(equalTo: centerXAnchor),
            formView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            formView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: -30),
            formView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 30),
            formView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: -30),
            formView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 30),
            
            closeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            closeButton.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            closeButton.heightAnchor.constraint(equalToConstant: 18),
            closeButton.widthAnchor.constraint(equalToConstant: 18),

        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func closeAddRestaurant(sender: NSButton) {
        presenter.closeAddRestaurantSheet()
    }
    
}
