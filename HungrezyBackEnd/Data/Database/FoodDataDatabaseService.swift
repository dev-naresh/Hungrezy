//
//  FoodDataDatabaseService.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 13/04/23.
//

import Foundation
import SQLite3

class FoodDataDatabaseService {
    var DB: OpaquePointer?
    var dbUrl: URL
    
    init() {
        self.dbUrl = try! FileManager.default.url(for: .documentDirectory, in: .allDomainsMask, appropriateFor: nil, create: false).appendingPathComponent("hungrezy.sqlite")
        print(dbUrl.path)
        if sqlite3_open(dbUrl.path, &DB) == SQLITE_OK {
            print("Database connected successfully")
            createFoodTable(success: success, failure: failure)
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

extension FoodDataDatabaseService : FoodDataDatabaseContract {
    func createFoodTable(success: @escaping (String) -> Void, failure: @escaping (String) -> Void) {
        var statement: OpaquePointer?
        let query = "CREATE TABLE if not exists Food ( foodID TEXT, restaurantID TEXT, name TEXT,  imageURL TEXT, description TEXT, cuisine TEXT, isVegetarian BOOL, price INTEGER, ratings REAL, ratingsCount INTEGER );"
        if sqlite3_prepare(DB, query, -1, &statement, nil) == SQLITE_OK{
            if sqlite3_step(statement) == SQLITE_DONE{
                success("Food table created")
            } else {
                failure("Food table not created")
            }
        } else {
            failure("Food table not created \(sqlite3_errmsg(DB)!)")
        }
        sqlite3_finalize(statement)
    }
    
    func insertIntoFoodTable(food: Food, success: @escaping (Food) -> Void, failure: @escaping (String) -> Void) {
        var statement: OpaquePointer?
        let query = "insert into Food (\"foodID\", \"restaurantID\", \"name\", \"imageURL\", \"description\", \"cuisine\", \"isVegetarian\", \"price\", \"ratings\", \"ratingsCount\") values(\"\(food.foodID)\", \"\(food.restaurantID)\", \"\(food.name)\", \"\(food.imageURL)\", \"\(food.description)\", \"\(food.cuisine)\", \"\(food.isVegetarian)\", \"\(food.price)\", \"\(food.ratings)\", \"\(food.ratingsCount)\");"
        
        if sqlite3_prepare(DB, query, -1, &statement, nil) == SQLITE_OK{
            if sqlite3_step(statement) == SQLITE_DONE{
                success(food)
            } else {
                failure("Restaurant not added")
            }
        } else {
            failure("Restaurant not added")
        }
        sqlite3_finalize(statement)
    }
    
    func fetchFood(filters: [String], success: @escaping ([Food]) -> Void, failure: @escaping (String) -> Void) {
        var statement: OpaquePointer?
        let filter = filters.joined(separator: " and ")
        let query = "select * from Food where \(filter);"
        print(query)
        var foods: [Food] = []
        if sqlite3_prepare(DB, query, -1, &statement, nil) == SQLITE_OK{
//            DispatchQueue.main.async {
                while sqlite3_step(statement) == SQLITE_ROW {
                    let foodID = String(cString: sqlite3_column_text(statement, 0))
                    let restaurantID = String(cString: sqlite3_column_text(statement, 1))
                    let name = String(cString: sqlite3_column_text(statement, 2))
                    let imageURL = String(cString: sqlite3_column_text(statement, 3))
                    let description = String(cString: sqlite3_column_text(statement, 4))
                    let cuisine = String(cString: sqlite3_column_text(statement, 5))
                    let isVegetarianString = String(cString: sqlite3_column_text(statement, 6))
                    let price = sqlite3_column_int(statement, 7)
                    let ratings = sqlite3_column_double(statement, 8)
                    let ratingsCount = sqlite3_column_int(statement, 9)
                    
                    var isVegetarian: Bool
                    switch isVegetarianString {
                    case "true":
                        isVegetarian = true
                    case "false":
                        isVegetarian = false
                    default:
                        isVegetarian = false
                    }

                    let food = Food(foodID: foodID, restaurantID: restaurantID, name: name, imageURL: imageURL, description: description, cuisine: cuisine, isVegetarian: isVegetarian, price: Int(price), ratings: Float(ratings), ratingsCount: Int(ratingsCount))
                    
                    foods.append(food)
                }
//            }
            success(foods)
        } else {
            failure("Failed to fetch data")
        }
        sqlite3_finalize(statement)
    }
}
