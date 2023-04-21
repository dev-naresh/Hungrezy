//
//  CartView.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 17/04/23.
//

import Cocoa
import LocalAuthentication

class CartView : NSView {
    weak var foodListView: FoodListView?
    var cart: [Food] = []
    var quantity: [Int] = []
    var restaurant: Restaurant
    
    lazy var restaurantLabel: NSTextField = {
        let view = NSTextField()
        view.isEditable = false
        view.isBordered = false
        view.backgroundColor = .clear
        view.lineBreakMode = .byTruncatingTail
        view.stringValue = restaurant.name 
        let fontDescriptor = NSFontDescriptor(name: "Cochin", size: 25).withSymbolicTraits(.bold)
        view.font = NSFont(descriptor: fontDescriptor, size: 25)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }()
    
    lazy var clearCartButton: NSButton = {
        var button = NSButton()
        button.title = "Clear Cart"
//        button.image = NSImage(systemSymbolName: "cart", accessibilityDescription: nil)
//        button.imagePosition = .
        button.contentTintColor = .white
        button.isBordered = false
        button.wantsLayer = true
        button.layer?.cornerRadius = 10
        button.layer?.backgroundColor = NSColor.controlAccentColor.cgColor
        button.target = self
        button.action = #selector(clearCart)
        button.translatesAutoresizingMaskIntoConstraints = false
        addSubview(button)
        return button
    }()
    
    lazy var paymentButton: NSButton = {
        var button = NSButton()
        button.title = "Pay ₹ 0"
        button.isEnabled = false
//        button.image = NSImage(systemSymbolName: "indianrupeesign.circle", accessibilityDescription: nil)
        button.imagePosition = .imageLeft
        button.contentTintColor = .white
        button.isBordered = false
        button.wantsLayer = true
        button.layer?.backgroundColor = NSColor.controlAccentColor.cgColor
        button.layer?.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.target = self
        button.action = #selector(payAction)
        addSubview(button)
        return button
    }()
    
    lazy var tableView: NSTableView = {
        var view = NSTableView()
        let column = NSTableColumn(identifier: NSUserInterfaceItemIdentifier("com.hungrezy.cart"))
        view.headerView = nil
        view.intercellSpacing = NSSize(width: 0, height: 10)
//        view.gridStyleMask = .solidHorizontalGridLineMask
        view.gridColor = .controlAccentColor
        view.selectionHighlightStyle = .none
        view.cell?.backgroundStyle = .emphasized
        view.addTableColumn(column)
        view.delegate = self
        view.dataSource = self
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }()
    
    lazy var scrollView: NSScrollView = {
        let view = NSScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.hasHorizontalScroller = true
        view.hasVerticalScroller = true
        view.documentView = tableView
        addSubview(view)
        return view
    }()
    
    lazy var cartTotalView: CartTotalView = {
        let view = CartTotalView()
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }()
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        wantsLayer = true
        layer?.backgroundColor = NSColor.controlBackgroundColor.cgColor
        layer?.cornerRadius = 10
    }
    
    func updateCartTotal() {
        var cartTotal = 0
        var quantityTotal = 0
        for i in 0..<cart.count {
            cartTotal += (cart[i].price * quantity[i])
            quantityTotal += quantity[i]
        }
        let tax: Int = Int(0.05 * Double(cartTotal))
        let packingFee = quantityTotal * 10
        let deliveryFee = 40
        
        if cartTotal > 0 {
            cartTotalView.addChargeValues(cartTotal: cartTotal, tax: tax, packingFee: packingFee, deliveryFee: deliveryFee)
            let grandTotal = cartTotal + tax + packingFee + deliveryFee
            paymentButton.title = "Pay ₹ \(grandTotal)"
            paymentButton.isEnabled = true
        } else {
            cartTotalView.addChargeValues(cartTotal: 0, tax: 0, packingFee: 0, deliveryFee: 0)
            paymentButton.title = "Pay ₹ 0"
            paymentButton.isEnabled = false
        }
    }
    
    init(restaurant: Restaurant) {
        self.restaurant = restaurant
        super.init(frame: NSZeroRect)
        
        NSLayoutConstraint.activate([
            restaurantLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            restaurantLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            restaurantLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            restaurantLabel.bottomAnchor.constraint(equalTo: scrollView.topAnchor, constant: -5),
            
//            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: cartTotalView.topAnchor, constant: -10),
            
            cartTotalView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            cartTotalView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            cartTotalView.bottomAnchor.constraint(equalTo: clearCartButton.topAnchor, constant: -15),
            cartTotalView.bottomAnchor.constraint(equalTo: paymentButton.topAnchor, constant: -15),
            
            clearCartButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            clearCartButton.trailingAnchor.constraint(equalTo: paymentButton.leadingAnchor, constant: -15),
            paymentButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            clearCartButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            paymentButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            
            clearCartButton.widthAnchor.constraint(equalTo: paymentButton.widthAnchor),
            clearCartButton.heightAnchor.constraint(equalToConstant: 30),
            paymentButton.heightAnchor.constraint(equalTo: clearCartButton.heightAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CartView: NSTableViewDelegate {
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cellIdentifier = NSUserInterfaceItemIdentifier("com.hungrezy.cart")
        
        var cellView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? CartTableCellView
        
        if cellView == nil {
            cellView = CartTableCellView()
            cellView?.identifier = cellIdentifier
        }
        
        cellView?.addValues(food: cart[row], quantity: quantity[row], cartView: self)
        return cellView
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 50
    }
}

extension CartView: NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return cart.count
    }
}

extension CartView {
    @objc func payAction(sender: NSButton) {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Pay using Apple Pay") { (success, error) in
                if success {
                    print("Authentication succeeded")
                    DispatchQueue.main.async {
                        (self.superview as? MenuView)?.presenter.launchOrdersModule()
                    }
                } else {
                    print("Authentication failed: \(error?.localizedDescription ?? "Unknown error")")
                }
            }
        } else {
            print("Biometric authentication not available: \(error?.localizedDescription ?? "Unknown error")")
        }

        
    }
    
    @objc func clearCart(sender: NSButton) {
        (superview as? MenuView)?.presenter.relaunchMenuView(restaurant: restaurant)
    }
}
