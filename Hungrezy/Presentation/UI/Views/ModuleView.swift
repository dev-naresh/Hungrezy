//
//  ModuleView.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 05/04/23.
//

import Cocoa

class ModuleView: NSView {
    var presenter: ModulePresenterContract
    
    lazy var deliveryButtonView: NSButton = {
        var button = NSButton()
        button.image = NSImage(systemSymbolName: "takeoutbag.and.cup.and.straw.fill", accessibilityDescription: nil)
        button.contentTintColor = .controlAccentColor
        button.imageScaling = .scaleProportionallyUpOrDown
        button.isBordered = false
        button.imagePosition = .imageOnly
        button.target = self
        button.action = #selector(deliveryButtonAction)
        button.translatesAutoresizingMaskIntoConstraints = false
        addSubview(button)
        return button
    }()
    
    lazy var dineOutButtonView: NSButton = {
        var button = NSButton()
        button.image = NSImage(systemSymbolName: "fork.knife.circle", accessibilityDescription: nil)
        button.imageScaling = .scaleProportionallyUpOrDown
        button.isBordered = false
        button.imagePosition = .imageOnly
        button.target = self
        button.action = #selector(dineOutButtonAction)
        button.translatesAutoresizingMaskIntoConstraints = false
        addSubview(button)
        return button
    }()
    
    lazy var blogsButtonView: NSButton = {
        var button = NSButton()
        button.image = NSImage(systemSymbolName: "doc.richtext", accessibilityDescription: nil)
        button.imageScaling = .scaleProportionallyUpOrDown
        button.isBordered = false
        button.imagePosition = .imageOnly
        button.target = self
        button.action = #selector(blogsButtonAction)
        button.translatesAutoresizingMaskIntoConstraints = false
        addSubview(button)
        return button
    }()
    
    lazy var ordersButtonView: NSButton = {
        var button = NSButton()
        button.image = NSImage(systemSymbolName: "bag", accessibilityDescription: nil)
        button.imageScaling = .scaleProportionallyUpOrDown
        button.isBordered = false
        button.imagePosition = .imageOnly
        button.target = self
        button.action = #selector(ordersButtonAction)
        button.translatesAutoresizingMaskIntoConstraints = false
        addSubview(button)
        return button
    }()
    
    lazy var deliveryTextLabel: NSTextField = {
        var textField = NSTextField(labelWithString: "Delivery")
        textField.font = .systemFont(ofSize: 12)
        textField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textField)
        return textField
    }()
    
    lazy var dineOutTextLabel: NSTextField = {
        var textField = NSTextField(labelWithString: "Dine Out")
        textField.font = .systemFont(ofSize: 12)
        textField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textField)
        return textField
    }()
    
    lazy var blogsTextLabel: NSTextField = {
        var textField = NSTextField(labelWithString: "Blogs")
        textField.font = .systemFont(ofSize: 12)
        textField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textField)
        return textField
    }()
    
    lazy var ordersTextLabel: NSTextField = {
        var textField = NSTextField(labelWithString: "Orders")
        textField.font = .systemFont(ofSize: 12)
        textField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textField)
        return textField
    }()
    
    init(presenter: ModulePresenterContract) {
        self.presenter = presenter
        super.init(frame: NSZeroRect)
        
        NSLayoutConstraint.activate([
            deliveryButtonView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            deliveryButtonView.centerXAnchor.constraint(equalTo: centerXAnchor),
            deliveryButtonView.heightAnchor.constraint(equalToConstant: 30),
            deliveryButtonView.widthAnchor.constraint(equalToConstant: 30),
            
            deliveryTextLabel.topAnchor.constraint(equalTo: deliveryButtonView.bottomAnchor, constant: 3),
            deliveryTextLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            dineOutButtonView.topAnchor.constraint(equalTo: deliveryTextLabel.bottomAnchor, constant: 25),
            dineOutButtonView.centerXAnchor.constraint(equalTo: centerXAnchor),
            dineOutButtonView.heightAnchor.constraint(equalToConstant: 30),
            dineOutButtonView.widthAnchor.constraint(equalToConstant: 30),
            
            dineOutTextLabel.topAnchor.constraint(equalTo: dineOutButtonView.bottomAnchor, constant: 3),
            dineOutTextLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            blogsButtonView.topAnchor.constraint(equalTo: dineOutTextLabel.bottomAnchor, constant: 25),
            blogsButtonView.centerXAnchor.constraint(equalTo: centerXAnchor),
            blogsButtonView.heightAnchor.constraint(equalToConstant: 30),
            blogsButtonView.widthAnchor.constraint(equalToConstant: 30),
            
            blogsTextLabel.topAnchor.constraint(equalTo: blogsButtonView.bottomAnchor, constant: 3),
            blogsTextLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            ordersButtonView.topAnchor.constraint(equalTo: blogsTextLabel.bottomAnchor, constant: 25),
            ordersButtonView.centerXAnchor.constraint(equalTo: centerXAnchor),
            ordersButtonView.heightAnchor.constraint(equalToConstant: 30),
            ordersButtonView.widthAnchor.constraint(equalToConstant: 30),
            
            ordersTextLabel.topAnchor.constraint(equalTo: ordersButtonView.bottomAnchor, constant: 3),
            ordersTextLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            widthAnchor.constraint(equalToConstant: 80),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ModuleView {
    func resetImage() {
        deliveryButtonView.image = NSImage(systemSymbolName: "takeoutbag.and.cup.and.straw", accessibilityDescription: nil)
        deliveryButtonView.contentTintColor = nil
        dineOutButtonView.image = NSImage(systemSymbolName: "fork.knife.circle", accessibilityDescription: nil)
        dineOutButtonView.contentTintColor = nil
        blogsButtonView.image = NSImage(systemSymbolName: "doc.richtext", accessibilityDescription: nil)
        blogsButtonView.contentTintColor = nil
        ordersButtonView.image = NSImage(systemSymbolName: "bag", accessibilityDescription: nil)
        ordersButtonView.contentTintColor = nil
    }
    
    @objc func deliveryButtonAction(sender: NSButton) {
        resetImage()
        sender.image = NSImage(systemSymbolName: "takeoutbag.and.cup.and.straw.fill", accessibilityDescription: nil)
        sender.contentTintColor = .controlAccentColor
        presenter.loadDeliveryModule(location: Location.Chennai)
    }
    
    @objc func dineOutButtonAction(sender: NSButton) {
        resetImage()
        sender.image = NSImage(systemSymbolName: "fork.knife.circle.fill", accessibilityDescription: nil)
        sender.contentTintColor = .controlAccentColor
        presenter.loadDineOutModule(location: Location.Chennai)
    }
    
    @objc func blogsButtonAction(sender: NSButton) {
        resetImage()
        sender.image = NSImage(systemSymbolName: "doc.richtext.fill", accessibilityDescription: nil)
        sender.contentTintColor = .controlAccentColor
        presenter.loadBlogModule(location: Location.Chennai)
    }
    
    @objc func ordersButtonAction(sender: NSButton) {
        resetImage()
        sender.image = NSImage(systemSymbolName: "bag.fill", accessibilityDescription: nil)
        sender.contentTintColor = .controlAccentColor
        presenter.loadOrdersModule()
    }
}

extension ModuleView: ModuleViewContract {
    
}
