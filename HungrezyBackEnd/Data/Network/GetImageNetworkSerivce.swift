//
//  GetImageNetworkSerivce.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 24/04/23.
//

import Foundation

class GetImageNetworkSerivce {
    init() {
        
    }
}

extension GetImageNetworkSerivce : GetImageNetworkContract {
    func getImage(from imageURL: String, success: @escaping (Data) -> Void, failure: @escaping (Error?) -> Void) {
        if let url = URL(string: imageURL) {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data, error == nil else {
                    failure(error as? Error)
                    return
                }
                success(data)
            }
            task.resume()
        }
    }
}
