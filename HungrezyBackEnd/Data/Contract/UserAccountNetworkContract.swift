//
//  UserAccountNetworkContract.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 30/03/23.
//

import Foundation

protocol UserAccountNetworkContract {
    func addUser(user: User, success: @escaping (User) -> Void, failure: @escaping (String) -> Void)
    func fetchUserInfo(emailID: String, success: @escaping ([User]) -> Void, failure: @escaping (String) -> Void)
}
