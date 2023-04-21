//
//  AddUserContract.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 30/03/23.
//

import Foundation

protocol AddUserContract {
    func addUser(user: User, success: @escaping (User) -> Void, failure: @escaping (AddUserError) -> Void)
}
