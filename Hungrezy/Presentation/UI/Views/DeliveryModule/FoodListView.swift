//
//  FoodListView.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 17/04/23.
//

import Cocoa

class FoodListView : NSView {
    weak var cartView: CartView?
    var presenter: FoodListPresenterContract
    
    var foods: [Food] = [] {
        didSet {
            foodModels = []
            for food in foods {
                let model = FoodModel(foodID: food.foodID, foodName: food.name, foodDescription: food.description, priceTag: food.price, foodImageUrl: food.imageURL, foodImage: nil, ratings: food.ratings, cuisine: food.cuisine, isVegetarian: food.isVegetarian, quantity: 0)
                foodModels.append(model)
            }
            tableView.reloadData()
        }
    }
    var foodModels: [FoodModel] = [] {
        didSet {
            filteredFoodModels = foodModels
        }
    }
    
    var filteredFoodModels: [FoodModel] = []
//    var foodImages: [Int : NSImage] = [:]
    
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
    
    init(presenter: FoodListPresenterContract) {
        self.presenter = presenter
        super.init(frame: NSZeroRect)
        
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
            cellView?.foodListView = self
            cellView?.identifier = cellIdentifier
        }
        
        if filteredFoodModels[row].foodImage == nil {
            presenter.getFoodImageData(index: row, imageUrl: filteredFoodModels[row].foodImageUrl)
        }
        
        cellView?.model = filteredFoodModels[row]
        return cellView
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 95
    }
}

extension FoodListView : NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return filteredFoodModels.count
    }
}

extension FoodListView : FoodListViewContract {
    func applySorting(by sortingType: SortingType) {
        switch sortingType {
        case .PriceHighToLow:
            filteredFoodModels = filteredFoodModels.sorted { $0.priceTag > $1.priceTag }
        case .PriceLowToHigh:
            filteredFoodModels = filteredFoodModels.sorted { $0.priceTag < $1.priceTag }
        case .RatingHighToLow:
            filteredFoodModels = filteredFoodModels.sorted { $0.ratings > $1.ratings }
        default:
            break
        }
        tableView.reloadData()
    }
    
    func applyFilters(starRatingAbove ratings: Float = 0, isPureVegeterian: Bool = false, isChettinad: Bool = false, isChinese: Bool = false, isContinental: Bool = false, isIndian: Bool = false, isItalian: Bool = false, isBiryani: Bool = false, isStreetFood: Bool = false) {
        
        filteredFoodModels = []
        for food in foodModels {
            var cuisines: [String] = []
            
            if isChettinad {
                cuisines.append("Chettinad")
            }
            
            if isChinese {
                cuisines.append("Chinese")
            }
            
            if isContinental {
                cuisines.append("Continental")
            }
            
            if isIndian {
                cuisines.append("Indian")
            }
            
            if isItalian {
                cuisines.append("Italian")
            }
            
            if isBiryani {
                cuisines.append("Biryani")
            }
            
            if isStreetFood {
                cuisines.append("Street Food")
            }
            
            if food.ratings > ratings && (isPureVegeterian == false ? true : food.isVegetarian) {
                for cuisine in cuisines {
                    if food.cuisine.contains(cuisine) {
                        filteredFoodModels.append(food)
                        break
                    }
                }
                if cuisines == [] {
                    filteredFoodModels.append(food)
                }
            }
        }
        tableView.reloadData()
    }
    
    func updateCart() {
        var cartModels: [FoodModel] = []
        
        for foodModel in foodModels {
            if foodModel.quantity > 0 {
                cartModels.append(foodModel)
            }
        }
        
        cartView?.foodModels = cartModels
    }
        
    func updateImage(row: Int, imageData: Data) {
        guard let image = NSImage(data: imageData) else {
            print("Invalid image data")
            return
        }
        self.filteredFoodModels[row].foodImage = image
        self.filteredFoodModels[row].foodImage?.size = NSSize(width: 100, height: 75)
        tableView.reloadData(forRowIndexes: IndexSet(integer: row), columnIndexes: [0])
    }
}
