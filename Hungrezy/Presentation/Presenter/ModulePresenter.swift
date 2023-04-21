//
//  ModulePresenter.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 07/04/23.
//

import Foundation

class ModulePresenter {
    weak var view: ModuleViewContract?
    weak var router: HomeViewRouterContract?
    
    init() {
        
    }
}

extension ModulePresenter : ModulePresenterContract {
    func loadDeliveryModule(location: Location) {
        router?.loadDeliveryModule(location: location)
    }
    
    func loadDineOutModule(location: Location) {
        router?.loadDineOutModule(location: location)
    }
    
    func loadBlogModule(location: Location) {
        router?.loadBlogModule(location: location)
    }
    
    func loadOrdersModule() {
        router?.loadOrdersModule()
    }
}
