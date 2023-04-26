//
//  AuthenticationRouterContract.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 30/03/23.
//

import Foundation

protocol AuthenticationRouterContract: AnyObject {
//    func launchAuthenticationView()
    func launchHomeView(user: User)
    func launchAuthenticationFailedAlert()
}
