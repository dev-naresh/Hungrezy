//
//  AuthenticationPresenterContract.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 30/03/23.
//

import Foundation

protocol AuthenticationPresenterContract: AnyObject {
    func addNewUser(user: User)
    func authenticateUser(emailID: String, password: String)
}
