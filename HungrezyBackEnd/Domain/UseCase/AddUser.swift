//
//  AddUser.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 30/03/23.
//

import Foundation

final class AddUserRequest: Request {
    var user: User
    init(user: User) {
        self.user = user
        super.init(id: user.id)
    }
}

final class AddUserResponse: Response {
    
}

final class AddUserError: Error {
    
}

class AddUser: UseCase<AddUserRequest, AddUserResponse, AddUserError> {
    var dataManager: AddUserContract
    
    init(dataManager: AddUserContract) {
        self.dataManager = dataManager
    }
    
    override func run(request: AddUserRequest, success: @escaping (AddUserResponse) -> Void, failure: @escaping (AddUserError) -> Void){
        dataManager.addUser(user: request.user, success: { [weak self] (user) in
            self?.success(user: user, callBack: success)
        }, failure: { [weak self] (error) in
            self?.failure(error: error, callBack: failure)
        })
    }
    
    private func success(user: User, callBack: @escaping (AddUserResponse) -> Void) {
        let response = AddUserResponse()
        invokeSuccess(callback: callBack, response: response)
    }
    
    private func failure(error: AddUserError ,callBack: @escaping (AddUserError) -> Void){
        invokeFailure(callback: callBack, failure: error)
    }
}
