//
//  GetImageContract.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 24/04/23.
//

import Foundation

protocol GetImageContract {
    func getImage(imageUrl: String, success: @escaping (Data) -> Void, failure: @escaping (GetImageError) -> Void)
}
