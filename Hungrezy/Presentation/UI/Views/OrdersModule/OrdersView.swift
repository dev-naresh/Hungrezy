//
//  OrdersView.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 07/04/23.
//

import AppKit

class OrdersView: NSView {
    var presenter: OrdersViewPresenterContract
    var user: User
    
    lazy var ordersListView: OrdersListView = {
        var view = OrdersListView()
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }()
    
    lazy var ordersDetailedView: OrdersDetailedView = {
        var view = OrdersDetailedView()
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }()
    
    init(user: User, presenter: OrdersViewPresenterContract) {
        self.presenter = presenter
        self.user = user
        super.init(frame: NSZeroRect)
        
        presenter.getOrdersList(user: user)
        
        NSLayoutConstraint.activate([
            ordersListView.leadingAnchor.constraint(equalTo: leadingAnchor),
            ordersListView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            ordersListView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            ordersListView.trailingAnchor.constraint(equalTo: ordersDetailedView.leadingAnchor, constant: -10),
            
            ordersListView.widthAnchor.constraint(greaterThanOrEqualToConstant: 500),
            
            ordersDetailedView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            ordersDetailedView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            ordersDetailedView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            ordersDetailedView.widthAnchor.constraint(equalTo: ordersListView.widthAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension OrdersView : OrdersViewContract {
    func updateRestaurantImage(index: Int, imageData: Data) {
        guard let image = NSImage(data: imageData) else {
            print("Invalid image data")
            return
        }
        ordersListView.orderModels[index].restaurantImage = image
        ordersListView.orderModels[index].restaurantImage?.size = NSSize(width: 110, height: 75)
        ordersListView.tableView.reloadData(forRowIndexes: IndexSet(integer: index), columnIndexes: [0])
    }
    
    func updateOrdersList(orders: [Order]) {
        ordersListView.orders = orders
    }
    
    func updateRestaurantData(restaurant: Restaurant) {
        ordersListView.restaurantData[restaurant.id] = restaurant
    }
}
