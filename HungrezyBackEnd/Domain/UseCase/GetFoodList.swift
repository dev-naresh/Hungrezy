//
//  GetFoodList.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 13/04/23.
//

import Foundation

final class GetFoodListRequest: Request {
    var filters: [String]
    init(filters: [String]) {
        self.filters = filters
        super.init()
    }
}

final class GetFoodListResponse: Response {
    var foods: [Food]
    
    init(foods: [Food]) {
        self.foods = foods
    }
}

final class GetFoodListError: Error {
    
}

class GetFoodList : UseCase<GetFoodListRequest, GetFoodListResponse, GetFoodListError> {
    var dataManager: GetFoodListContract
    
    init(dataManager: GetFoodListContract) {
        self.dataManager = dataManager
    }
    
    override func run(request: GetFoodListRequest, success: @escaping (GetFoodListResponse) -> Void, failure: @escaping (GetFoodListError) -> Void) {
        dataManager.getFoodList(filters: request.filters, success: { [weak self] (foods) in
            self?.success(foods: foods, callBack: success)
        }, failure: { [weak self] (error) in
            self?.failure(error: error, callBack: failure)
        })
    }
    
    func success(foods: [Food], callBack: @escaping (GetFoodListResponse) -> Void){
        let response = GetFoodListResponse(foods: foods)
        invokeSuccess(callback: callBack, response: response)
    }
    
    func failure(error: GetFoodListError, callBack: @escaping (GetFoodListError) -> Void){
        invokeFailure(callback: callBack, failure: error)
    }
}
