//
//  ProfileViewPresenter.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 07/04/23.
//

import Foundation

class ProfileViewPresenter {
    weak var view: ProfileViewContract?
    weak var router: ProfileViewRouterContract?
    
    init() {
        
    }
}

extension ProfileViewPresenter : ProfileViewPresenterContract {
    func logOutUser() {
        router?.launchAuthenticationView()
    }
}
