//
//  OrdersTableCellView.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 26/04/23.
//

import Cocoa

protocol OrderModelContract {
    var orderID: String { get }
    var restaurantName: String { get }
    var restaurantLocality: String { get }
    var restaurantCuisines: String { get }
    var restaurantImageURL: String { get }
    var restaurantImage: NSImage? { get set }
    var orderStatus: OrderStatus { get }
    var orderDateTime: NSDate { get }
    var orderTotal: Int { get }
}

class OrderModel: OrderModelContract {
    var orderID: String
    var restaurantName: String
    var restaurantLocality: String
    var restaurantCuisines: String
    var restaurantImageURL: String
    var restaurantImage: NSImage?
    var orderStatus: OrderStatus
    var orderDateTime: NSDate
    var orderTotal: Int
    
    init(orderID: String, restaurantName: String, restaurantLocality: String, restaurantCuisines: String, restaurantImageURL: String, restaurantImage: NSImage? = nil, orderStatus: OrderStatus, orderDateTime: NSDate, orderTotal: Int) {
        self.orderID = orderID
        self.restaurantName = restaurantName
        self.restaurantLocality = restaurantLocality
        self.restaurantCuisines = restaurantCuisines
        self.restaurantImageURL = restaurantImageURL
        self.restaurantImage = restaurantImage
        self.orderStatus = orderStatus
        self.orderDateTime = orderDateTime
        self.orderTotal = orderTotal
    }
}


class OrdersTableCellView : NSTableCellView {
    weak var ordersListView: OrdersListView?
    var model: OrderModelContract? {
        didSet {
            if let model = model {
                restaurantName.stringValue = model.restaurantName
                restaurantLocality.stringValue = model.restaurantLocality
                restaurantCuisines.stringValue = model.restaurantCuisines
                image.image = model.restaurantImage
                statusField.stringValue = model.orderStatus.rawValue
                
                let calendar = Calendar.current
                let date = Date(timeIntervalSinceReferenceDate: model.orderDateTime.timeIntervalSinceReferenceDate)
                let hour = calendar.component(.hour, from: date)
                let minute = calendar.component(.minute, from: date)
                let year = calendar.component(.year, from: date)
                let day = calendar.component(.day, from: date)
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MMMM"
                let monthName = dateFormatter.string(from: date)
                
                let hourFormat = String(format: "%02d", hour)
                let minuteFormat = String(format: "%02d", minute)

                dateAndTime.stringValue = "\(day) \(String(monthName.prefix(3))), \(year) at \(hourFormat):\(minuteFormat)"

                priceTag.stringValue = "₹ \(model.orderTotal).00"
            }
        }
    }
    
    lazy var restaurantName: NSTextField = {
        let view = NSTextField()
        view.stringValue = "Restaurant Name"
        view.isEditable = false
        view.isBordered = false
        view.backgroundColor = .clear
        view.maximumNumberOfLines = 1
        view.lineBreakMode = .byWordWrapping
        view.cell?.truncatesLastVisibleLine = true
        let fontDescriptor = NSFontDescriptor(name: "Cochin", size: 20).withSymbolicTraits(.bold)
        view.font = NSFont(descriptor: fontDescriptor, size: 20)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }()
    
    lazy var restaurantLocality: NSTextField = {
        let view = NSTextField()
        view.stringValue = "Urapakkam, Chennai"
        view.isEditable = false
        view.isBordered = false
        view.backgroundColor = .clear
        view.alignment = .justified
        view.font = NSFont(name: "Georgia", size: 14)
        view.maximumNumberOfLines = 1
        view.lineBreakMode = .byWordWrapping
        view.cell?.truncatesLastVisibleLine = true
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }()
    
    lazy var restaurantCuisines: NSTextField = {
        let view = NSTextField()
        view.stringValue = "Indian, Chinese, Continental"
        view.isEditable = false
        view.isBordered = false
        view.backgroundColor = .clear
        view.alignment = .justified
        view.font = NSFont(name: "Georgia", size: 14)
        view.maximumNumberOfLines = 1
        view.lineBreakMode = .byWordWrapping
        view.cell?.truncatesLastVisibleLine = true
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }()
    
    lazy var dateAndTime: NSTextField = {
        let view = NSTextField()
        view.stringValue = "Sample String"
        view.isEditable = false
        view.isBordered = false
        view.backgroundColor = .clear
        view.alignment = .right
        view.font = NSFont(name: "Georgia", size: 14)
        view.maximumNumberOfLines = 3
        view.lineBreakMode = .byWordWrapping
        view.cell?.truncatesLastVisibleLine = true
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }()
    
    lazy var priceTag: NSTextField = {
        let view = NSTextField()
        view.stringValue = "Sample String"
        view.isEditable = false
        view.isBordered = false
        view.backgroundColor = .clear
        view.alignment = .right
//        view.lineBreakMode = .byTruncatingTail
        let fontDescriptor = NSFontDescriptor(name: "Optima", size: 16).withSymbolicTraits(.bold)
        view.font = NSFont(descriptor: fontDescriptor, size: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }()
    
    lazy var statusView: NSView = {
        var view = NSView()
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.red.cgColor
        view.layer?.cornerRadius = 3
        view.addSubview(statusField)
        
        NSLayoutConstraint.activate([
            statusField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4),
            statusField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -4),
            statusField.topAnchor.constraint(equalTo: view.topAnchor, constant: 3),
            statusField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -3),
        ])
        
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }()
    
    lazy var statusField: NSTextField = {
        var field = NSTextField(labelWithString: "Ordered")
        field.textColor = .white
        field.font = .boldSystemFont(ofSize: 14)
        field.translatesAutoresizingMaskIntoConstraints = false
        addSubview(field)
        return field
    }()
    
    
    lazy var image: NSImageView = {
        let view = NSImageView()
        view.imageScaling = .scaleProportionallyUpOrDown
        view.contentTintColor = .controlAccentColor
        view.image = NSImage(systemSymbolName: "fork.knife.circle", accessibilityDescription: nil)
        view.image?.size = NSSize(width: 110, height: 75)
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
            image.trailingAnchor.constraint(equalTo: restaurantName.leadingAnchor, constant: -10),
            image.trailingAnchor.constraint(equalTo: restaurantLocality.leadingAnchor, constant: -10),
            image.trailingAnchor.constraint(equalTo: restaurantCuisines.leadingAnchor, constant: -10),
            image.heightAnchor.constraint(equalToConstant: 75),
            image.widthAnchor.constraint(equalToConstant: 110),
            
            restaurantName.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            restaurantLocality.topAnchor.constraint(equalTo: restaurantName.bottomAnchor, constant: 7),
            restaurantCuisines.topAnchor.constraint(equalTo: restaurantLocality.bottomAnchor, constant: 7),
            
            restaurantName.trailingAnchor.constraint(lessThanOrEqualTo: dateAndTime.leadingAnchor, constant: -10),
            restaurantLocality.trailingAnchor.constraint(lessThanOrEqualTo: dateAndTime.leadingAnchor, constant: -10),
            restaurantCuisines.trailingAnchor.constraint(lessThanOrEqualTo: dateAndTime.leadingAnchor, constant: -10),
            
            statusView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            statusView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            statusView.bottomAnchor.constraint(equalTo: dateAndTime.topAnchor, constant: -7),
            
            dateAndTime.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            dateAndTime.bottomAnchor.constraint(equalTo: priceTag.topAnchor, constant: -7),
            dateAndTime.widthAnchor.constraint(equalToConstant: 140),
            priceTag.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            priceTag.widthAnchor.constraint(equalToConstant: 100),
            
            heightAnchor.constraint(equalToConstant: 95),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
