//
//  OrderListView.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 26/04/23.
//

import Cocoa

class OrdersListView : NSView {
    var restaurantData: [String : Restaurant] = [:]
    
    var orders: [Order] = [] {
        didSet {
            print(orders)
            orderModels = []
            for order in orders {
                if let restaurant = restaurantData[order.restaurantID] {
                    let orderModel = OrderModel(orderID: order.orderID, restaurantName: restaurant.name, restaurantLocality: restaurant.locality, restaurantCuisines: restaurant.cuisines, restaurantImageURL: restaurant.imageURL, orderStatus: order.orderStatus, orderDateTime: TimeConverter.int64ToDate(timestamp: order.orderDate), orderTotal: order.grandTotal)
//                    print(orderModel)
                    orderModels.append(orderModel)
                } else {
                    (superview as? OrdersView)?.presenter.addRestaurantInfo(restaurantID: order.restaurantID)
                    
//                    let orderModel = OrderModel(orderID: order.orderID, restaurantName: "restaurant.name", restaurantLocality: "restaurant.locality", restaurantCuisines: "restaurant.cuisines", restaurantImageURL: "restaurant.imageURL", orderStatus: order.orderStatus, orderDateTime: TimeConverter.int64ToDate(timestamp: order.orderDate), orderTotal: order.grandTotal)
//                    orderModels.append(orderModel)
                }
            }
            orderModels.reverse()
            tableView.reloadData()
        }
    }
    
    var orderModels: [OrderModel] = []
    
    lazy var tableView: NSTableView = {
        var view = NSTableView()
        let column = NSTableColumn(identifier: NSUserInterfaceItemIdentifier("com.hungrezy.orders"))
        view.headerView = nil
        view.intercellSpacing = NSSize(width: 0, height: 10)
//        view.gridStyleMask = .solidHorizontalGridLineMask
//        view.gridColor = .controlAccentColor
//        view.selectionHighlightStyle = .none
//        view.cell?.backgroundStyle = .emphasized
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
        view.hasVerticalScroller = true
        view.documentView = tableView
        addSubview(view)
        return view
    }()
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        wantsLayer = true
        layer?.backgroundColor = NSColor.controlBackgroundColor.cgColor
        layer?.cornerRadius = 10
    }
    
    init() {
        super.init(frame: NSZeroRect)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension OrdersListView : NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return orderModels.count
    }
}

extension OrdersListView : NSTableViewDelegate {
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 95
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cellIdentifier = NSUserInterfaceItemIdentifier("com.hungrezy.orders")
        
        var cellView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? OrdersTableCellView
        
        if cellView == nil {
            cellView = OrdersTableCellView()
            cellView?.ordersListView = self
            cellView?.identifier = cellIdentifier
        }
        
        if orderModels[row].restaurantImage == nil {
            (superview as? OrdersView)?.presenter.getRestaurantImageData(index: row, imageUrl: orderModels[row].restaurantImageURL)
        }
        
        cellView?.model = orderModels[row]
        return cellView
    }
}
