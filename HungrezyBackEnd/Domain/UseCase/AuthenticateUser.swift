//
//  AuthenticateUser.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 01/04/23.
//

import Foundation

final class AuthenticateUserRequest: Request {
    var mailID: String
    var password: String
    init(mailID: String, password: String) {
        self.mailID = mailID
        self.password = password
        super.init()
    }
}

final class AuthenticateUserResponse: Response {
    var user: User
    
    init(user: User) {
        self.user = user
    }
}

final class AuthenticateUserError: Error {
    
}

class AuthenticateUser : UseCase<AuthenticateUserRequest, AuthenticateUserResponse, AuthenticateUserError> {
    var dataManager: AuthenticateUserContract
    
    init(dataManager: AuthenticateUserContract) {
        self.dataManager = dataManager
    }
    
    override func run(request: AuthenticateUserRequest, success: @escaping (AuthenticateUserResponse) -> Void, failure: @escaping (AuthenticateUserError) -> Void) {
        dataManager.authenticateUser(emailID: request.mailID, password: request.password, success: { [weak self] (user) in
            self?.success(user: user, callBack: success)
        }, failure: { [weak self] (error) in
            self?.failure(error: error, callBack: failure)
        })
    }
    
    func success(user: User, callBack: @escaping (AuthenticateUserResponse) -> Void){
        let response = AuthenticateUserResponse(user: user)
        invokeSuccess(callback: callBack, response: response)
    }
    
    func failure(error: AuthenticateUserError, callBack: @escaping (AuthenticateUserError) -> Void){
        invokeFailure(callback: callBack, failure: error)
    }
}
