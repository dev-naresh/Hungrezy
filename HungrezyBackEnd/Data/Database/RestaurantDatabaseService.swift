//
//  RestaurantDatabaseService.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 10/04/23.
//

import Foundation
import SQLite3

class RestaurantDatabaseService {
    var DB: OpaquePointer?
    var dbUrl: URL
    
    init() {
        self.dbUrl = try! FileManager.default.url(for: .documentDirectory, in: .allDomainsMask, appropriateFor: nil, create: false).appendingPathComponent("hungrezy.sqlite")
        print(dbUrl.path)
        if sqlite3_open(dbUrl.path, &DB) == SQLITE_OK {
            print("Database connected successfully")
            createRestaurantTable(success: success, failure: failure)
        }
        else {
            print("Database failed to connect")
        }
    }
    
    private func success(message: String) {
        print(message)
    }
    
    private func failure(message: String) {
        print(message)
    }
}

extension RestaurantDatabaseService : RestaurantDataDatabaseContract {
    func createRestaurantTable(success: @escaping (String) -> Void, failure: @escaping (String) -> Void) {
        var statement: OpaquePointer?
        let query = "CREATE TABLE if not exists Restaurants ( id TEXT, name TEXT, address TEXT, city TEXT, latitude REAL, longitude REAL, pincode INTEGER, locality TEXT, openTime INTEGER, closeTime INTEGER, facilities TEXT, cuisines TEXT, averageCost INTEGER, ratings REAL, contactNumber INTEGER, diningType INTEGER, imageURL TEXT );"
        if sqlite3_prepare(DB, query, -1, &statement, nil) == SQLITE_OK{
            if sqlite3_step(statement) == SQLITE_DONE{
                success("Restaurant table created")
            } else {
                failure("Restaurant table not created")
            }
        } else {
            failure("Restaurant table not created \(sqlite3_errmsg(DB)!)")
        }
        sqlite3_finalize(statement)
    }
    
    
    func insertIntoRestaurantTable(restaurant: Restaurant, success: @escaping (Restaurant) -> Void, failure: @escaping (String) -> Void) {
        var statement: OpaquePointer?
        let query = "insert into Restaurants (\"id\", \"name\", \"address\", \"city\", \"latitude\", \"longitude\", \"pincode\", \"locality\", \"openTime\", \"closeTime\", \"facilities\", \"cuisines\", \"averageCost\", \"ratings\", \"contactNumber\", \"diningType\", \"imageURL\") values(\"\(restaurant.id)\", \"\(restaurant.name)\", \"\(restaurant.address)\", \"\(restaurant.city)\", \"\(restaurant.latitude)\", \"\(restaurant.longitude)\", \"\(restaurant.pinCode)\", \"\(restaurant.locality)\", \"\(restaurant.openTime)\", \"\(restaurant.closeTime)\", \"\(restaurant.facilities)\", \"\(restaurant.cuisines)\", \"\(restaurant.averageCost)\", \"\(restaurant.ratings)\", \"\(restaurant.contactNumber)\", \"\(restaurant.diningType)\", \"\(restaurant.imageURL)\");"
        
        if sqlite3_prepare(DB, query, -1, &statement, nil) == SQLITE_OK{
            if sqlite3_step(statement) == SQLITE_DONE{
                success(restaurant)
            } else {
                failure("Restaurant not added")
            }
        } else {
            failure("Restaurant not added")
        }
        sqlite3_finalize(statement)
    }
    
    func fetchRestaurants(filters: [String], success: @escaping ([Restaurant]) -> Void, failure: @escaping (String) -> Void) {
        var statement: OpaquePointer?
        let filter = filters.joined(separator: " and ")
        let query = "select * from Restaurants where \(filter);"
        print(query)
        var restaurants: [Restaurant] = []
        if sqlite3_prepare(DB, query, -1, &statement, nil) == SQLITE_OK{
//            DispatchQueue.main.async {
                while sqlite3_step(statement) == SQLITE_ROW {
                    let id = String(cString: sqlite3_column_text(statement, 0))
                    let name = String(cString: sqlite3_column_text(statement, 1))
                    let address = String(cString: sqlite3_column_text(statement, 2))
    //                let city = String(cString: sqlite3_column_text(statement, 3))
                    let latitude = sqlite3_column_double(statement, 4)
                    let longitude = sqlite3_column_double(statement, 5)
                    let pinCode = sqlite3_column_int(statement, 6)
                    let locality = String(cString: sqlite3_column_text(statement, 7))
                    let openTime = sqlite3_column_int(statement, 8)
                    let closeTime = sqlite3_column_int(statement, 9)
                    let facilities = String(cString: sqlite3_column_text(statement, 10))
                    let cuisines = String(cString: sqlite3_column_text(statement, 11))
                    let averageCost = sqlite3_column_int(statement, 12)
                    let ratings = sqlite3_column_double(statement, 13)
                    let contactNumber = sqlite3_column_int(statement, 14)
                    let diningType = sqlite3_column_int(statement, 15)
                    let imageURL = String(cString: sqlite3_column_text(statement, 16))
                    
                    var city: Location
                    switch String(cString: sqlite3_column_text(statement, 3)) {
                    case "Chennai":
                        city = Location.Chennai
                    case "Coimbatore":
                        city = Location.Coimbatore
                    case "Bangalore":
                        city = Location.Bangalore
                    default:
                        city = Location.Chennai
                    }

                    let restaurant = Restaurant(id: id, name: name, address: address, city: city, latitude: latitude, longitude: longitude, pinCode: pinCode, locality: locality, openTime: openTime, closeTime: closeTime, facilities: facilities, cuisines: cuisines, averageCost: averageCost, ratings: Float(ratings), contactNumber: Int64(contactNumber), diningType: DiningType(rawValue: Int(diningType)) ?? DiningType.DineOut, imageURL: imageURL)
                    
                    restaurants.append(restaurant)
                }
//            }
            success(restaurants)
        } else {
            failure("Failed to fetch data")
        }
        sqlite3_finalize(statement)
    }
    
}
