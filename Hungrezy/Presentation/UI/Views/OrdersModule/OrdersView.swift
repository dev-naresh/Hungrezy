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
    
    lazy var ordersView: OrdersListView = {
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
            ordersView.leadingAnchor.constraint(equalTo: leadingAnchor),
            ordersView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            ordersView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            ordersView.trailingAnchor.constraint(equalTo: ordersDetailedView.leadingAnchor, constant: -10),
            
            ordersView.widthAnchor.constraint(greaterThanOrEqualToConstant: 500),
            
            ordersDetailedView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            ordersDetailedView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            ordersDetailedView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            ordersDetailedView.widthAnchor.constraint(equalTo: ordersView.widthAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension OrdersView : OrdersViewContract {
    
}
