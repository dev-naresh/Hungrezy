//
//  DeliveryRestaurantView.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 11/04/23.
//

import Cocoa

class DeliveryRestaurantView : NSView {
    var restaurants: [Restaurant] = [] {
        didSet {
            restaurantModels = []
            for restaurant in restaurants {
                let model = RestaurantModel(restaurantName: restaurant.name, cuisines: restaurant.cuisines, ratings: restaurant.ratings, price: Int(restaurant.averageCost), imageUrl: restaurant.imageURL)
                restaurantModels.append(model)
            }
            collectionView.reloadData()
        }
    }
    
    var restaurantModels: [RestaurantModelContract] = [] {
        didSet {
            filteredRestaurantModels = restaurantModels
        }
    }
    
    var filteredRestaurantModels: [RestaurantModelContract] = []
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        wantsLayer = true
        layer?.backgroundColor = NSColor.controlBackgroundColor.cgColor
        layer?.cornerRadius = 10
    }
    
    lazy var collectionView: NSCollectionView = {
        var view = NSCollectionView()
        var collectionViewLayout = NSCollectionViewFlowLayout()
        view.delegate = self
        view.dataSource = self
        view.isSelectable = true
        view.enclosingScrollView?.hasHorizontalScroller = false
        view.enclosingScrollView?.hasVerticalScroller = false
        view.collectionViewLayout = collectionViewLayout
        view.register(RestaurantCollectionItemView.self, forItemWithIdentifier: NSUserInterfaceItemIdentifier("com.hungrezy.delivery"))
        collectionViewLayout.itemSize = NSSize(width: 284, height: 229)
        collectionViewLayout.minimumLineSpacing = 20
//        collectionViewLayout.minimumInteritemSpacing = 20
        
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }()
    
    lazy var scrollView: NSScrollView = {
        var view = NSScrollView()
//        view.wantsLayer = true
//        view.layer?.backgroundColor = NSColor.controlBackgroundColor.cgColor
        view.hasHorizontalScroller = false
        view.hasVerticalScroller = false
        view.horizontalScroller = nil
        view.verticalScroller = nil
        view.documentView = collectionView
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }()
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DeliveryRestaurantView : NSCollectionViewDelegate {
    func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
        (superview as? DeliveryView)?.presenter.getMenuView(restaurant: restaurants[indexPaths.first![1]])
    }
    
    func collectionView(_ collectionView: NSCollectionView, willDisplay item: NSCollectionViewItem, forRepresentedObjectAt indexPath: IndexPath) {
        let trackingArea = NSTrackingArea(rect: item.view.bounds, options: [.mouseEnteredAndExited, .activeInKeyWindow], owner: item, userInfo: nil)
        item.view.addTrackingArea(trackingArea)
    }
}

extension DeliveryRestaurantView : NSCollectionViewDataSource {
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
//        (superview as? DeliveryView)?.presenter.getRestaurantsList(filters: ["city=\"Chennai\""])
        return restaurants.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let view = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier("com.hungrezy.delivery"), for: indexPath) as! RestaurantCollectionItemView
        
        view.model = restaurantModels[indexPath[1]]
        
        if self.restaurantModels[indexPath[1]].image == nil {
            (self.superview as? DeliveryView)?.presenter.getFoodImageData(index: indexPath[1], imageUrl: view.model?.imageUrl ?? "")
        }
        
        return view
    }
}

extension DeliveryRestaurantView {
    func updateImage(row: Int, imageData: Data) {
        guard let image = NSImage(data: imageData) else {
            print("Invalid image data")
            return
        }
        self.restaurantModels[row].image = image
        self.restaurantModels[row].image?.size = NSSize(width: 270, height: 170)
        collectionView.reloadItems(at: [IndexPath(item: row, section: 0)])
    }
}
