//
//  GetImageNetworkContract.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 24/04/23.
//

import Foundation

protocol GetImageNetworkContract {
    func getImage(from imageURL: String, success: @escaping (Data) -> Void, failure: @escaping (Error?) -> Void)
}
