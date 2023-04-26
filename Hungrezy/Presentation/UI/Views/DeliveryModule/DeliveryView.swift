//
//  DeliveryView.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 07/04/23.
//

import AppKit

class DeliveryView: NSView {
    var presenter: DeliveryViewPresenterContract
    
    lazy var filtersView: DeliveryRestaurantFiltersView = {
        var view = DeliveryRestaurantFiltersView()
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }()
    
    lazy var deliveryRestaurantsView: DeliveryRestaurantView = {
        var view = DeliveryRestaurantView()
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }()
    
    init(presenter: DeliveryViewPresenterContract) {
        self.presenter = presenter
        super.init(frame: NSZeroRect)
        
        presenter.getRestaurantsList(filters: ["city=\"Chennai\"", "(diningType=0 or diningType=2)"])
        
        NSLayoutConstraint.activate([
            filtersView.leadingAnchor.constraint(equalTo: leadingAnchor),
            filtersView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            filtersView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            filtersView.trailingAnchor.constraint(equalTo: deliveryRestaurantsView.leadingAnchor, constant: -10),
            
            filtersView.widthAnchor.constraint(equalToConstant: 200),
            
            deliveryRestaurantsView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            deliveryRestaurantsView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            deliveryRestaurantsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            deliveryRestaurantsView.widthAnchor.constraint(greaterThanOrEqualToConstant: 500),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DeliveryView : DeliveryViewContract {
    func updateRestaurantImage(row: Int, imageData: Data) {
        deliveryRestaurantsView.updateImage(row: row, imageData: imageData)
    }
    
    func updateRestaurantsData(restaurants: [Restaurant]) {
        deliveryRestaurantsView.restaurants = restaurants
        deliveryRestaurantsView.collectionView.reloadData()
        print("Restaurant Data updated")
    }
}
