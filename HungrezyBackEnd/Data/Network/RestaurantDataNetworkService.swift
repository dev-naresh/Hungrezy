//
//  RestaurantDataNetworkService.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 08/04/23.
//

import Foundation

class RestaurantDataNetworkService {
    init() {
        
    }
}

extension RestaurantDataNetworkService  : RestaurantDataNetworkContract {
    func addRestaurant(restaurant: Restaurant, success: @escaping (Restaurant) -> Void, failure: @escaping (String) -> Void) {
        guard let url = URL(string: "https://642ffa52c26d69edc887fd53.mockapi.io/restaurant") else {
            print("Invalid link...")
            return
        }
        var req = URLRequest(url: url)
        req.httpMethod = "POST"
        req.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        req.httpBody = try? JSONEncoder().encode(restaurant)
        let session = URLSession.shared.dataTask(with: req) {
            data, response, error in
            let resResult = response as? HTTPURLResponse
            print("Status code:",resResult?.statusCode ?? 0)
            if let error = error {
                print(error.localizedDescription)
                failure("Failed to connect")
            } else {
                DispatchQueue.main.sync {
                    if let data = data {
                        let resData = (try? JSONSerialization.jsonObject(with: data, options: [])) as? Dictionary <String , Any>
                        print(resData ?? "")
                        success(restaurant)
                    } else {
                        failure("Failed to add Restaurant")
                    }
                }
            }
        }
        session.resume()
    }
    
    func fetchRestaurantInfo(city: Location, success: @escaping ([Restaurant]) -> Void, failure: @escaping (String) -> Void) {
        guard let url = URL(string: "https://642ffa52c26d69edc887fd53.mockapi.io/restaurant?emailID=\(city)") else {
            print("Invalid link...")
            return
        }
        let req = URLRequest(url: url)
        let session = URLSession.shared.dataTask(with: req) {
            data, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                if let data = data {
                    do {
                        let testObj = try JSONDecoder().decode([Restaurant].self, from: data)
                        success(testObj)
                    } catch {
                        print(error)
                        failure("Failed to fetch")
                    }
                }
            }
        }
        session.resume()
    }
    
    func fetchRestaurantInfo(restaurantID: String, success: @escaping (Restaurant) -> Void, failure: @escaping (String) -> Void) {
        guard let url = URL(string: "https://642ffa52c26d69edc887fd53.mockapi.io/restaurant/\(restaurantID)") else {
            print("Invalid link...")
            return
        }
        let req = URLRequest(url: url)
        let session = URLSession.shared.dataTask(with: req) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                if let data = data {
                    do {
                        let testObj = try JSONDecoder().decode(Restaurant.self, from: data)
                        success(testObj)
                    } catch {
                        failure("Failed to fetch")
                    }
                }
            }
        }
        session.resume()
    }
}
