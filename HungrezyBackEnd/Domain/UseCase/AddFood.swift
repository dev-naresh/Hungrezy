//
//  AddFood.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 13/04/23.
//

import Foundation

final class AddFoodRequest: Request {
    var food: Food
    init(food: Food) {
        self.food = food
        super.init(id: food.foodID)
    }
}

final class AddFoodResponse: Response {
    
}

final class AddFoodError: Error {
    
}

class AddFood: UseCase<AddFoodRequest, AddFoodResponse, AddFoodError> {
    var dataManager: AddFoodContract
    
    init(dataManager: AddFoodContract) {
        self.dataManager = dataManager
    }
    
    override func run(request: AddFoodRequest, success: @escaping (AddFoodResponse) -> Void, failure: @escaping (AddFoodError) -> Void){
        dataManager.addFood(food: request.food, success: { [weak self] (food) in
            self?.success(food: food, callBack: success)
        }, failure: { [weak self] (error) in
            self?.failure(error: error, callBack: failure)
        })
    }
    
    private func success(food: Food, callBack: @escaping (AddFoodResponse) -> Void) {
        let response = AddFoodResponse()
        invokeSuccess(callback: callBack, response: response)
    }
    
    private func failure(error: AddFoodError ,callBack: @escaping (AddFoodError) -> Void){
        invokeFailure(callback: callBack, failure: error)
    }
}
