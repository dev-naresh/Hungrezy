//
//  ToolBar.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 06/04/23.
//

import Cocoa

class ToolBar: NSToolbar {
    var user: User
    let userProfileButton = NSButton()
    let addRestaurantButton = NSButton()
    var profileView: ProfileView
    var router: ToolBarRouterContract
    
    init(user: User, identifier: NSToolbar.Identifier, profileView: ProfileView, router: ToolBarRouterContract) {
        self.user = user
        self.profileView = profileView
        self.router = router
        super.init(identifier: identifier)
        
        displayMode = .iconOnly
        delegate = self
        showsBaselineSeparator = false
        centeredItemIdentifier = .searchFieldItem
        
    }
}

extension ToolBar: NSToolbarDelegate {
    func toolbar(_ toolbar: NSToolbar, itemForItemIdentifier itemIdentifier: NSToolbarItem.Identifier, willBeInsertedIntoToolbar flag: Bool) -> NSToolbarItem? {
        let item = NSToolbarItem(itemIdentifier: itemIdentifier)
        switch (itemIdentifier) {
        case .searchFieldItem:
            let searchField = NSSearchField()
            item.view = searchField
            item.toolTip = "Comming Soon"
            return item
            
        case .logoImageItem:
            let imageView = NSImageView(image: NSImage(named: "logo1")!)
            imageView.image?.size = NSSize(width: 100, height: 35)
            item.view = imageView
            return item
            
        case .userProfileItem:
            userProfileButton.image = NSImage(systemSymbolName: "person.crop.circle", accessibilityDescription: nil)
            userProfileButton.image?.size = NSSize(width: 50, height: 50)
            userProfileButton.isBordered = false
            userProfileButton.imageScaling = .scaleProportionallyUpOrDown
            userProfileButton.target = self
            userProfileButton.action = #selector(showProfileView)
            userProfileButton.translatesAutoresizingMaskIntoConstraints = false
            item.view = userProfileButton
            NSLayoutConstraint.activate([
                userProfileButton.heightAnchor.constraint(equalToConstant: 35),
                userProfileButton.widthAnchor.constraint(equalToConstant: 35),
            ])
            return item
            
        case .addRestaurantButton:
            addRestaurantButton.title = "Add Restaurant"
            addRestaurantButton.isBordered = false
            addRestaurantButton.target = self
            addRestaurantButton.action = #selector(addRestaurantAction)
            addRestaurantButton.translatesAutoresizingMaskIntoConstraints = false
            item.view = addRestaurantButton
            return item
            
        default:
            return nil
        }
    }
        
    func toolbarDefaultItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        if user.userType.rawValue == 1 {
            return [.logoImageItem, .flexibleSpace, .searchFieldItem, .flexibleSpace, .userProfileItem, .space ]
        }
        return [ .logoImageItem, .flexibleSpace, .searchFieldItem, .flexibleSpace, .addRestaurantButton, .space, .userProfileItem, .space ]
    }
    
    func toolbarAllowedItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        return [ .logoImageItem, .searchFieldItem, .flexibleSpace, .userProfileItem, .space, .addRestaurantButton ]
    }
}

extension NSToolbarItem.Identifier {
    static let searchFieldItem = NSToolbarItem.Identifier("SearchFieldItem")
    static let userProfileItem = NSToolbarItem.Identifier("UserProfileItem")
    static let logoImageItem = NSToolbarItem.Identifier("LogoImageItem")
    static let addRestaurantButton = NSToolbarItem.Identifier("AddRestaurantButton")
}

extension ToolBar: NSSearchFieldDelegate {
    func searchFieldDidStartSearching(_ sender: NSSearchField) {
        print("Search field did start receiving input")
    }
    
    func searchFieldDidEndSearching(_ sender: NSSearchField) {
        print("Search field did end receiving input")
        sender.resignFirstResponder()
    }
}

extension ToolBar {
    @objc func showProfileView(sender: NSButton) {
        let popover = NSPopover()
        let viewController = NSViewController()
        viewController.view = profileView
        popover.contentViewController = viewController
        popover.behavior = .transient
        popover.animates = true
        popover.show(relativeTo: userProfileButton.bounds, of: userProfileButton, preferredEdge: .minY)
    }
    
    @objc func addRestaurantAction(sender: NSButton) {
        router.launchAddRestaurantWindow()
    }
}
