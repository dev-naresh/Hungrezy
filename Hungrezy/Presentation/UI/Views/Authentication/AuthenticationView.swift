//
//  AuthenticationView.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 30/03/23.
//

import Cocoa

class AuthenticationView : NSVisualEffectView {
    var presenter: AuthenticationPresenterContract
    var leftView = AuthenticationPageImageView()
    var rightView = AuthenticationPageFormContainerView(logInFormView: LogInFormView(), signUpFormView: SignUpFormView())
    
    init(presenter: AuthenticationPresenterContract) {
        self.presenter = presenter
        super.init(frame: NSZeroRect)
        self.wantsLayer = true

        leftView.layer?.cornerRadius = 15
        rightView.layer?.cornerRadius = 15
        leftView.translatesAutoresizingMaskIntoConstraints = false
        rightView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(leftView)
        addSubview(rightView)
        
        NSLayoutConstraint.activate([
            leftView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            leftView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            leftView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            leftView.trailingAnchor.constraint(equalTo: rightView.leadingAnchor, constant: -15),
            
            rightView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            rightView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            rightView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            leftView.widthAnchor.constraint(equalTo: rightView.widthAnchor),
            rightView.centerYAnchor.constraint(equalTo: centerYAnchor),
            rightView.widthAnchor.constraint(greaterThanOrEqualToConstant: 500),
            heightAnchor.constraint(greaterThanOrEqualToConstant: 700),
//            rightView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AuthenticationView : AuthenticationViewContract {
    
}
