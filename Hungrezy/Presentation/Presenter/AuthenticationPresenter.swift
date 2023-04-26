//
//  AuthenticationPresenter.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 30/03/23.
//

import Foundation

class AuthenticationPresenter {
    weak var view: AuthenticationViewContract?
    var addUser: AddUser
    var authenticateUser: AuthenticateUser
    weak var router: AuthenticationRouterContract?
    
    init(addUser: AddUser, authenticateUser: AuthenticateUser) {
        self.addUser = addUser
        self.authenticateUser = authenticateUser
    }
    
    func addUserResult() {
        print("User Added")
    }
    
    func addUserFailed() {
        print("Add User Failed")
    }
    
    func authenticateUserResult(user: User) {
        router?.launchHomeView(user: user)
    }
    
    func authenticateUserFailed() {
        router?.launchAuthenticationFailedAlert()
    }
}

extension AuthenticationPresenter : AuthenticationPresenterContract {
    func authenticateUser(emailID: String, password: String) {
        let request = AuthenticateUserRequest(mailID: emailID, password: password)
        authenticateUser.execute(request: request, onSuccess: { [weak self] (response) in
            self?.authenticateUserResult(user: response.user)
        }, onFailure: { [weak self] (error) in
            self?.authenticateUserFailed()
        })
    }
    
    func addNewUser(user: User) {
        let request = AddUserRequest(user: user)
        addUser.execute(request: request, onSuccess: { [weak self] (response) in
            self?.addUserResult()
        }, onFailure: { [weak self] (error) in
            self?.addUserFailed()
        })
    }
}
