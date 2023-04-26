//
//  Router.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 30/03/23.
//

import Cocoa

class Router {
    var window: NSWindow
    var homeView: HomeView?
    var formWindow: NSWindow?
//    var windowController = NSWindowController()
    let homeViewController = NSViewController()
    let addRestaurantController = AddRestaurantViewController()

    weak var authenticationView: AuthenticationView?
    
    init(window: NSWindow) {
        self.window = window
    }
    
    func launchAuthenticationView() {
        self.window.contentViewController = Assembler.getAuthenticationViewController(router: self)
        self.window.toolbar = nil
        self.window.titleVisibility = .visible
    }
    
    func getUser() -> User {
        return (window.toolbar as? ToolBar)!.user
    }
}

extension Router : AuthenticationRouterContract {
    func launchHomeView(user: User) {
        homeView = Assembler.getHomeView(user: user, router: self)
        let profileView = Assembler.getProfileView(user: user, router: self)
        self.window.contentView = homeView
        self.window.toolbar = ToolBar(user: user, identifier: .homeToolbarIdentifier, profileView: profileView, router: self)
        self.window.titleVisibility = .hidden
        self.window.toolbarStyle = .unified
        
        loadDeliveryModule(location: Location.Chennai)
    }
    
    func launchAuthenticationFailedAlert() {
        let alert = NSAlert()
        alert.alertStyle = .critical
        alert.addButton(withTitle: "Ok")
        alert.messageText = "Authentication failed"
        alert.informativeText = "Please check your EmailID and Password"
        alert.runModal()
        print("Authentication failed")
    }
}

extension Router : HomeViewRouterContract {
    func loadDeliveryModule(location: Location) {
        homeView?.contentView.removeFromSuperview()
        let view = Assembler.getDeliveryView(router: self, location: Location.Chennai)
//        homeView?.sideView.deliveryButtonAction(sender: nil)

        homeView?.addSubview(view)
        homeView?.contentView = view
        homeView?.contentView.translatesAutoresizingMaskIntoConstraints = false
        homeView?.setConstrints()
    }
    
    func loadDineOutModule(location: Location) {
        homeView?.contentView.removeFromSuperview()
        let view = Assembler.getDineOutView(location: Location.Chennai)
//        homeView?.sideView.dineOutButtonAction()

        homeView?.addSubview(view)
        homeView?.contentView = view
        homeView?.contentView.translatesAutoresizingMaskIntoConstraints = false
        homeView?.setConstrints()
    }
    
    func loadBlogModule(location: Location) {
        homeView?.contentView.removeFromSuperview()
        let view = Assembler.getBlogView(location: Location.Chennai)
//        homeView?.sideView.blogsButtonAction()

        homeView?.addSubview(view)
        homeView?.contentView = view
        homeView?.contentView.translatesAutoresizingMaskIntoConstraints = false
        homeView?.setConstrints()
    }
    
    func loadOrdersModule() {
        homeView?.contentView.removeFromSuperview()
        let view = Assembler.getOrdersView(user: homeView?.user, location: Location.Chennai)
//        homeView?.sideView.ordersButtonAction()
        
        
        homeView?.addSubview(view)
        homeView?.contentView = view
        homeView?.contentView.translatesAutoresizingMaskIntoConstraints = false
        homeView?.setConstrints()
    }
}

extension Router : ProfileViewRouterContract {
    
}

extension Router : ToolBarRouterContract {
    func launchAddRestaurantWindow() {
        let view = Assembler.getAddRestaurantView(router: self)
//        formWindow = NSWindow(contentRect: window.frame, styleMask: [.closable, .resizable, .titled, .miniaturizable], backing: .buffered, defer: false)
//        formWindow?.contentView = view
//        windowController.window = formWindow
//        windowController.showWindow(nil)
//        window.center()
        addRestaurantController.view = view
        view.window?.delegate = addRestaurantController
//        let homeViewController = NSViewController()
        homeViewController.view = homeView!
        homeViewController.presentAsSheet(addRestaurantController)
    }
}

extension Router: AddRestaurantFormRouterContract {
    func closeAddRestaurantWindow() {
//        windowController.close()
        homeViewController.dismiss(addRestaurantController)
    }
}

extension Router: DeliveryViewRouterContract {
    func loadMenuView(restaurant: Restaurant) {
        homeView?.contentView.removeFromSuperview()
        let view = Assembler.getMenuView(router: self, restaurant: restaurant)
        
        homeView?.addSubview(view)
        homeView?.contentView = view
        homeView?.contentView.translatesAutoresizingMaskIntoConstraints = false
        homeView?.setConstrints()
    }
}

extension Router: CartViewRouterContract {
    func launchOrdersModule() {
        homeView?.contentView.removeFromSuperview()
        let view = Assembler.getOrdersView(user: homeView?.user, location: Location.Chennai)
        
        homeView?.sideView.resetImage()
        homeView?.sideView.ordersButtonView.image = NSImage(systemSymbolName: "bag.fill", accessibilityDescription: nil)
        homeView?.sideView.ordersButtonView.contentTintColor = .controlAccentColor
        
        homeView?.addSubview(view)
        homeView?.contentView = view
        homeView?.contentView.translatesAutoresizingMaskIntoConstraints = false
        homeView?.setConstrints()
    }
}

extension Router: FoodListRouterContract {
    
}

extension Router: MenuViewRouterContract {
    
}
