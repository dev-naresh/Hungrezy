//
//  UserAccountsDataManager.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 29/03/23.
//

import Foundation

class UserAccountsDataManager {
    var database: UserAccountDatabaseContract
    var network: UserAccountNetworkContract
    
    init(database: UserAccountDatabaseContract, network: UserAccountNetworkContract) {
        self.database = database
        self.network = network
    }
    
    private func success(user: User, callback: (User) -> Void) {
        callback(user)
    }
    
    private func success(message: String, callback: (String) -> Void) {
        callback(message)
    }
    
    private func failure(message: String, callback: ((AddUserError) -> Void)) {
        if message == "No Data" {
            let error = AddUserError(status: .networkUnavailable)
            callback(error)
        } else if message == "Failed to fetch data" {
            let error = AddUserError(status: .authenticationFailure)
            callback(error)
        }
    }
    
    private func failure(message: String, callback: ((AuthenticateUserError) -> Void)) {
        if message == "No Data" {
            let error = AuthenticateUserError(status: .networkUnavailable)
            callback(error)
        } else if message == "Failed to fetch data" {
            let error = AuthenticateUserError(status: .authenticationFailure)
            callback(error)
        }
    }
    
    private func failure(message: String, callback: (String) -> Void) {
        callback(message)
    }
}

extension UserAccountsDataManager : AddUserContract {
    func addUser(user: User, success: @escaping (User) -> Void, failure: @escaping (AddUserError) -> Void) {
        network.addUser(user: user, success: { [weak self] (user) in
            self?.success(user: user, callback: success)
        }, failure: { [weak self] (message) in
            self?.failure(message: message, callback: failure)
        })
    }
}

extension UserAccountsDataManager : AuthenticateUserContract {
    func authenticateUser(emailID: String, password: String, success: @escaping (User) -> Void, failure: @escaping (AuthenticateUserError) -> Void) {
        
        database.truncateTable(success: { (message) in
            print(message)
        }, failure: { (message) in
            print(message)
        })
        
        network.fetchUserInfo(emailID: emailID, success: { [weak self] (users) in
            for user in users {
                print(user)
                self?.database.insertIntoUserTable(user: user, success: { (user) in
                    
                }, failure: { [weak self] (message) in
                    self?.failure(message: message, callback: failure)
                })
            }
            
            self?.database.fetchAccountInfo(emailID: emailID, success: { [weak self] (user) in
                if user.emailID == emailID && user.password == password {
                    self?.success(user: user, callback: success)
                } else {
                    self?.failure(message: "Invalid", callback: failure)
                }
            }, failure: { [weak self] (message) in
                self?.failure(message: message, callback: failure)
            })
        }, failure: { (message) in
            self.failure(message: message, callback: failure)
        })
    }
}
