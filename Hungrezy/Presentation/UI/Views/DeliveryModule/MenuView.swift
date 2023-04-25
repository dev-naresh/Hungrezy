//
//  MenuView.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 17/04/23.
//

import Cocoa

class MenuView : NSView {
    var restaurant: Restaurant
    var presenter: MenuViewPresenterContract
    
    lazy var filtersView: FoodItemsFilterView = {
        var view = FoodItemsFilterView()
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }()
    
    var foodListView: FoodListView
    
    lazy var cartView: CartView = {
        var view = CartView(restaurant: restaurant)
        view.restaurantLabel.stringValue = restaurant.name
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }()
    
    init(restaurant: Restaurant, foodListView: FoodListView, presenter: MenuViewPresenter) {
        self.foodListView = foodListView
        self.presenter = presenter
        self.restaurant = restaurant
        super.init(frame: NSZeroRect)
        
        foodListView.cartView = self.cartView
        foodListView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(foodListView)
        presenter.getFoodsList(filters: ["restaurantID=\(restaurant.id)"])
//        getRestaurantsList(filters: ["city=\"Chennai\""])
        
        NSLayoutConstraint.activate([
            filtersView.leadingAnchor.constraint(equalTo: leadingAnchor),
            filtersView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            filtersView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            filtersView.trailingAnchor.constraint(equalTo: foodListView.leadingAnchor, constant: -10),
            
            filtersView.widthAnchor.constraint(equalToConstant: 200),
            
            foodListView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            foodListView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            foodListView.trailingAnchor.constraint(equalTo: cartView.leadingAnchor, constant: -10),
            
            foodListView.widthAnchor.constraint(greaterThanOrEqualToConstant: 500),
            
            cartView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            cartView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            cartView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            cartView.widthAnchor.constraint(equalTo: foodListView.widthAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MenuView : MenuViewContract {
    func applyFiters(starRatingAbove: Float, isPureVegeterian: Bool, isChettinad: Bool, isChinese: Bool, isContinental: Bool, isIndian: Bool, isItalian: Bool, isBiryani: Bool, isStreetFood: Bool) {
        foodListView.applyFilters(starRatingAbove: starRatingAbove, isPureVegeterian: isPureVegeterian, isChettinad: isChettinad, isChinese: isChinese, isContinental: isContinental, isIndian: isIndian, isItalian: isItalian, isBiryani: isBiryani, isStreetFood: isStreetFood)
    }
    
    func applySorting(by sortingType: SortingType) {
        foodListView.applySorting(by: sortingType)
    }
    
    func updateFoodsData(foods: [Food]) {
        foodListView.foods = foods
    }
}
