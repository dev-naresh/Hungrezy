//
//  FoodListView.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 17/04/23.
//

import Cocoa

class FoodListView : NSView {
    weak var cartView: CartView?
    
    var foods: [Food] = [] {
        didSet {
            for food in foods {
                let model = FoodModel(foodName: food.name, foodDescription: food.description, priceTag: food.price, foodImage: <#T##NSImage#>, ratings: food.ratings, isVegetarian: food.isVegetarian, quantity: <#T##Int#>)
            }
        }
    }
    var models: [FoodModel] = []
    var foodImages: [Int : NSImage] = [:]
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        wantsLayer = true
        layer?.backgroundColor = NSColor.controlColor.cgColor
        layer?.cornerRadius = 10
    }
    
    lazy var tableView: NSTableView = {
        var view = NSTableView()
        let column = NSTableColumn(identifier: NSUserInterfaceItemIdentifier("com.hungrezy.food"))
        view.headerView = nil
        view.intercellSpacing = NSSize(width: 0, height: 10)
//        view.gridStyleMask = .solidHorizontalGridLineMask
        view.gridColor = .controlAccentColor
        view.selectionHighlightStyle = .none
        view.cell?.backgroundStyle = .emphasized
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
//        view.hasHorizontalScroller = true
        view.hasVerticalScroller = true
        view.documentView = tableView
        addSubview(view)
        return view
    }()
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
//        foods.append(Food(foodID: "101", restaurantID: "adfjawiefha", name: "rgjkbqrjgk", imageURL: "afkjb", description: "aigahfi", cuisine: "efawf", isVegetarian: true, price: 90, ratings: 3.8, ratingsCount: 890))
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FoodListView : NSTableViewDelegate {
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cellIdentifier = NSUserInterfaceItemIdentifier("com.hungrezy.food")
        
        var cellView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? FoodTableCellView
        
        if cellView == nil {
            cellView = FoodTableCellView()
            cellView?.identifier = cellIdentifier
        }
        
        if self.foodImages[row] == nil {
            if let url = URL(string: foods[row].imageURL) {
                let task = URLSession.shared.dataTask(with: url) { data, response, error in
                    guard let data = data, error == nil else {
                        print("Error loading image: \(error?.localizedDescription ?? "unknown error")")
                        return
                    }
                    DispatchQueue.main.async {
                        guard let image = NSImage(data: data) else {
                            print("Invalid image data")
                            return
                        }
                        self.foodImages[row] = image
                        self.foodImages[row]?.size = NSSize(width: 100, height: 75)
                        tableView.reloadData(forRowIndexes: IndexSet(integer: row), columnIndexes: [0])
                        print(row)
                    }
                }
                task.resume()
            }
        }
        
        var quantity = 0
        if (cartView?.cart.contains(foods[row]) == true) {
            let index = (cartView?.cart.firstIndex(of: foods[row]))!
            quantity = (cartView?.quantity[index])!
        }
        
        
        cellView?.model = models[row]
        return cellView
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 95
    }
}

extension FoodListView : NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return foods.count
    }
}

extension FoodListView {
    func addItemToCart(food: Food) {
        if ((cartView?.cart.contains(food)) == true) {
            let index = (cartView?.cart.firstIndex(of: food))!
            cartView?.quantity[index] += 1
            
        } else {
            cartView?.cart.append(food)
            cartView?.quantity.append(1)
        }
        cartView?.tableView.reloadData()
        cartView?.updateCartTotal()
    }
    
    func removeItemFromCart(food: Food) {
        if (cartView?.cart.contains(food) == true) {
            if let i = (cartView?.cart.firstIndex(of: food)) {
                let index: Int = cartView!.cart.distance(from: cartView!.cart.startIndex, to: i)
                print(index) // Prints 4
                cartView?.quantity[index] -= 1
                if cartView?.quantity[index] ?? -1 <= 0 {
                    cartView?.cart.remove(at: index)
                    cartView?.quantity.remove(at: index)
                }
            }
        }
        cartView?.tableView.reloadData()
        cartView?.updateCartTotal()
    }
}
