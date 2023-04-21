//
//  AuthenticateUserContract.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 01/04/23.
//

import Foundation

protocol AuthenticateUserContract {
    func authenticateUser(emailID: String, password: String, success: @escaping (User) -> Void, failure: @escaping (AuthenticateUserError) -> Void)
}
