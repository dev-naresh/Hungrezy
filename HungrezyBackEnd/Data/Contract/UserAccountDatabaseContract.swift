//
//  UserAccountDatabaseContract.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 29/03/23.
//

import Foundation

protocol UserAccountDatabaseContract {
    func createUserTable(success: @escaping (String) -> Void, failure: @escaping (String) -> Void)
    func insertIntoUserTable(user: User, success: @escaping (User) -> Void, failure: @escaping (String) -> Void)
    func fetchAccountInfo(emailID: String, success: @escaping (User) -> Void, failure: @escaping (String) -> Void)
    func truncateTable(success: @escaping (String) -> Void, failure: @escaping (String) -> Void)
}
