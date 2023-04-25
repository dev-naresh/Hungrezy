//
//  AppDelegate.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 29/03/23.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet var window: NSWindow!
    var router: Router?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
//        window.contentViewController = RestaurantCollectionItemView()
        
        router = Router(window: window)
        router?.launchAuthenticationView()
        
//        network.getImage(from: "https://cocoacasts.s3.amazonaws.com/what-is-fatalerror-in-sift-and-when-to-use-it/figure-fatalerror-swift-1.jpg", success: { (data) in
//            print(data)
//        }, failure: { (error) in
//            print(error)
//        })
        
//        window.contentView = MapView()
        
//        var database = OrdersDataDatabaseService()
//        database.insertIntoOrderTable(order: Order(orderID: "101", userID: "102", restaurantID: "103", foodIDs: ["101", "102", "103"], quantities: [1,4,5], cartTotal: 5000, gst: 250, packingFee: 50, deliveryFee: 40, grandTotal: 5450), success: { (order) in
//            print(order)
//        }, failure: { (message) in
//            print(message)
//        })
//        database.fetchOrder(restaurantID: "102", success: { (order) in
//            print(order)
//        }, failure: { (message) in
//            print(message)
//        })
        
//        var network = OrdersDataNetworkService()
//        network.addOrder(order: Order(orderID: "101", userID: "102", restaurantID: "103", foodIDs: ["101", "102", "103"], quantities: [1,4,5], cartTotal: 5000, gst: 250, packingFee: 50, deliveryFee: 40, grandTotal: 5450), success: { (order) in
//            print(order)
//        }, failure: { (message) in
//            print(message)
//        }
//        )
//        network.fetchOrderInfo(restaurantID: "103", success: { (order) in
//            print(order)
//        }, failure: { (message) in
//            print(message)
//        })
        
//        window.contentView = CartTaxesView()
        
//        window.contentView = AddRestaurantView(presenter: AddRestaurantFormPresenter(addRestaurant: AddRestaurant(dataManager: RestaurantDataManager(database: RestaurantDatabaseService(), network: RestaurantDataNetworkService()))), frame: NSZeroRect)
        
//        var database = FoodDataDatabaseService()
//        var network = FoodDataNetworkService()
        
//        network.addFood(food: Food(foodID: "1", restaurantID: "1", name: "Biryani", imageURL: "", description: "", cuisine: "", isVegetarian: false, price: 200, ratings: 4.2, ratingsCount: 423), success: { (food) in
//            print(food)
//        }, failure: { (message) in
//            print(message)
//        })
        
//        database.fetchFood(filters: [], success: { (food) in
//            for i in food {
//                network.addFood(food: i, success: { (food) in
//                    sleep(3)
//                }, failure:  { (message) in
//
//                })
//            }
//        }, failure: { (message) in
//            print(message)
//        })
        
//        network.fetchFoodInfo(restaurantID: "3", success: { (food) in
//            print(food)
//        }, failure: { (message) in
//            print(message)
//        })
        
//        database.
//
//        database.insertIntoRestaurantTable(restaurant: Restaurant(id: "101", name: "Hotel", address: Address(doorNumber: "5C", addressLine1: "Street", addressLine2: "Street", city: .Chennai, pinCode: 987654), openTime: 9900, closeTime: 9900, facilities: "Nothing", contactNumber: 9876543210, diningType: .Delivery), success: { (restaurant) in
//            print(restaurant)
//        }, failure: { (message) in
//            print(message)
//        })
        
//        database.fetchRestaurants(city: Location.Chennai, success: { (restaurant) in
//            print(restaurant)
//        }, failure: { (message) in
//            print(message)
//        })
        
//        database.truncateTable(success: { (message) in
//            print(message)
//        }, failure: { (message) in
//            print(message)
//        })
        
//        var network = RestaurantDataNetworkService()
//
//        network.addRestaurant(restaurant: Restaurant(id: "101", name: "KFC", address: Address(doorNumber: "5", addressLine1: "Guduvanchery", addressLine2: "Urapakkam", city: Location.Chennai, pinCode: 603202), openTime: 100, closeTime: 100, facilities: "Food, AC, Hygiene", contactNumber: 9876543210, diningType: .DeliveryAndDineOut, imageURL: ""), success: { (restaruant) in
//            print(restaruant)
//        }, failure: { (message) in
//            print(message)
//        })
//
//        network.fetchRestaurantInfo(city: Location.Chennai, success: { (restaurant) in
//            print(restaurant)
//        }, failure: { (message) in
//            print(message)
//        })
        
//        window.contentView = MapView()
//        router?.launchHomeView(user: User(id: "101", name: "", phoneNumber: 9, emailID: "", password: ""))
        
//        window.toolbar = ToolBar(identifier: .homeToolbarIdentifier)
        
//        var database = UserAccountDatabaseService()
//        database.truncateTable(success: { (message) in
//            print(message)
//        }, failure: {(message) in
//            print(message)
//        })

//        database.fetchAccountInfo(emailID: "diwaan675@gmail.com", success: { (user) in
//            print(user)
//        }, failure: { (message) in
//            print(message)
//        })

//            let manager = UserAccountsDataManager(database: UserAccountDatabaseService(), network: UserAccountNetworkService())
//            manager.authenticateUser(emailID: "diwaan675@gmail.com", password: "Diwaa", success: {(user) in
//                print("Authenticated successfully")
//            }, failure: {(message) in
//                print("Authentication failed")
//            })
        

//        var network = UserAccountNetworkService()
//        network.fetchUserInfo(emailID: "diwaan675@gmail.co", success: {(user) in
//            print(user)
//        }, failure: { (message) in
//            print(message)
//        })
        
//        var dm = UserAccountsDataManager(database: UserAccountDatabaseService(), network: UserAccountNetworkService())
//        dm.authenticateUser(emailID: "diwaan675@gmail.com", password: "Diwaan*12", success: { (user) in
//            print(user)
//        }, failure: { (message) in
//            print(message)
//        })
        
//        window.contentView = SignUpView(presenter: SignUpPresenter(addUser: AddUser(dataManager: UserAccountsDataManager(database: UserAccountDatabaseService(), network: UserAccountNetworkService()))))
        
//        var db = UserAccountDatabaseService()
//
//        var user = User(id: 102, name: "Diwaan", phoneNumber: 8220563544, emailID: "diwaan675@gmail.com", password: "Diwaan*123", profilePictureURL: "www.diwaan.com")
//        db.createUserTable()
////        db.insertIntoUserTable(user: user, success: { (user) in
////            print("Inserted")
////        }, failure: { _ in
////            print("Insertion Failed")
////        })
//
//        db.fetchAccountInfo(userID: 101, success: { (user) in
//            print("Inserted")
//        }, failure: { _ in
//            print("Insertion Failed")
//        })
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


}

extension NSToolbar.Identifier {
    static let homeToolbarIdentifier = NSToolbar.Identifier("HomeToolbar")
}
