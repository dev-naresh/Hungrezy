//
//  UserAccountNetworkService.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 30/03/23.
//

import Foundation

class UserAccountNetworkService {
    init() {
        
    }
}
 
extension UserAccountNetworkService : UserAccountNetworkContract {
    func addUser(user: User, success: @escaping (User) -> Void, failure: @escaping (String) -> Void) {
        guard let url = URL(string: "https://642432664740174043357d2b.mockapi.io/users") else {
            print("Invalid link...")
            return
        }
        var req = URLRequest(url: url)
        req.httpMethod = "POST"
        req.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        req.httpBody = try? JSONEncoder().encode(user)
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
                        success(user)
                    } else {
                        failure("Failed to add User")
                    }
                }
            }
        }
        session.resume()
    }
    
    func fetchUserInfo(emailID: String, success: @escaping ([User]) -> Void, failure: @escaping (String) -> Void) {
        guard let url = URL(string: "https://642432664740174043357d2b.mockapi.io/users?emailID=\(emailID)") else {
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
                        let testObj = try JSONDecoder().decode([User].self, from: data)
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
}
