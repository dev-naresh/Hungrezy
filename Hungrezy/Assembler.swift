//
//  Assembler.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 30/03/23.
//

import Foundation

class Assembler {
    static func getAuthenticationViewController(router: AuthenticationRouterContract) -> AuthenticationViewController {
        let addUserUseCase = getAddUserUseCase()
        let authenticateUserUseCase = getAuthenticateUserUseCase()
        let presenter = AuthenticationPresenter(addUser: addUserUseCase, authenticateUser: authenticateUserUseCase)
        presenter.router = router
        let view = AuthenticationView(presenter: presenter)
        view.presenter = presenter
        presenter.view = view
        let viewController = AuthenticationViewController(router: router, view: view)
        return viewController
    }
    
    private static func getAddUserUseCase() -> AddUser {
        let database = UserAccountDatabaseService()
        let network = UserAccountNetworkService()
        let dataManager = UserAccountsDataManager(database: database, network: network)
        let useCase = AddUser(dataManager: dataManager)
        return useCase
    }
    
    private static func getAuthenticateUserUseCase() -> AuthenticateUser {
        let database = UserAccountDatabaseService()
        let network = UserAccountNetworkService()
        let dataManager = UserAccountsDataManager(database: database, network: network)
        let useCase = AuthenticateUser(dataManager: dataManager)
        return useCase
    }
    
    static func getHomeView(user: User, router: HomeViewRouterContract) -> HomeView {
        let modulePresenter = ModulePresenter()
        let moduleView = ModuleView(presenter: modulePresenter)
        modulePresenter.router = router
        modulePresenter.view = moduleView
        let view = HomeView(user: user, frame: NSZeroRect, sideView: moduleView)
        return view
    }
    
    static func getProfileView(user: User, router: ProfileViewRouterContract) -> ProfileView {
        let presenter = ProfileViewPresenter()
        let view = ProfileView(name: user.name, mailID: user.emailID, presenter: presenter)
        presenter.router = router
        presenter.view = view
        view.presenter = presenter 
        return view
    }
    
    static func getDeliveryView(router: Router, location: Location) -> DeliveryView {
        let useCase = getGetRestaurantListUseCase()
        let presenter = DeliveryViewPresenter(getRestaurantList: useCase)
        let view = DeliveryView(presenter: presenter)
        presenter.router = router
        presenter.view = view
        view.presenter = presenter
        return view
    }
    
    private static func getGetRestaurantListUseCase() -> GetRestaurantList {
        let database = RestaurantDatabaseService()
        let network = RestaurantDataNetworkService()
        let dataManager = RestaurantDataManager(database: database, network: network)
        let useCase = GetRestaurantList(dataManager: dataManager)
        return useCase
    }
    
    static func getDineOutView(location: Location) -> DineOutView {
        let view = DineOutView()
        return view
    }
    
    static func getBlogView(location: Location) -> BlogView {
        let view = BlogView()
        return view
    }
    
    static func getOrdersView(user: User?, location: Location) -> OrdersView {
        let view = OrdersView(user: user)
        return view
    }
    
    static func getAddRestaurantView(router: AddRestaurantFormRouterContract) -> AddRestaurantView {
        let useCase = getAddRestaurantUseCase()
        let presenter = AddRestaurantFormPresenter(addRestaurant: useCase)
        presenter.router = router
        let view = AddRestaurantView(presenter: presenter, frame: NSZeroRect)
        view.presenter = presenter
        presenter.view = view.scrollView.documentView as! AddRestaurantForm?
        return view
    }
    
    private static func getAddRestaurantUseCase() -> AddRestaurant {
        let database = RestaurantDatabaseService()
        let network = RestaurantDataNetworkService()
        let dataManager = RestaurantDataManager(database: database, network: network)
        let useCase = AddRestaurant(dataManager: dataManager)
        return useCase
    }
    
    static func getMenuView(router: MenuViewRouterContract, restaurant: Restaurant) -> MenuView {
        let useCase = getGetFoodListUseCase()
        let presenter = MenuViewPresenter(getFoodList: useCase)
        presenter.router = router
        
        let foodListView = getFoodListView(router: router as! Router)
        let view = MenuView(restaurant: restaurant, foodListView: foodListView, presenter: presenter)
        
        view.foodListView = foodListView
        view.presenter = presenter
        presenter.view = view
        return view
    }
    
    private static func getGetFoodListUseCase() -> GetFoodList {
        let database = FoodDataDatabaseService()
        let network = FoodDataNetworkService()
        let dataManager = FoodDataManager(database: database, network: network)
        let useCase = GetFoodList(dataManager: dataManager)
        return useCase
    }
    
    static func getFoodListView(router: FoodListRouterContract) -> FoodListView {
        let useCase = getGetImageUseCase()
        let presenter = FoodListViewPresenter(getImage: useCase)
        presenter.router = router
        let view = FoodListView(presenter: presenter)
        view.presenter = presenter
        presenter.view = view
        return view
    }
    
    private static func getGetImageUseCase() -> GetImage {
        let network = GetImageNetworkSerivce()
        let dataManager = GetImageDataManager(network: network)
        let useCase = GetImage(dataManager: dataManager)
        return useCase
    }
}
