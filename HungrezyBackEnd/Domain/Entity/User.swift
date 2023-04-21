//
//  User.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 29/03/23.
//

import Foundation

struct User: Codable {
    var id: String
    var name: String
    var phoneNumber: Int64
    var emailID: String
    var password: String
    var profilePictureURL: String?
    var userType: UserType
}
