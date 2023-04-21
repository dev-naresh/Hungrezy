//
//  AuthenticationPageFormContainerView.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 30/03/23.
//

import Cocoa

class AuthenticationPageFormContainerView : NSView {
    var logInFormView: LogInFormView
    var signUpFormView: SignUpFormView
//    var formView: NSView
    
    lazy var instructionTextField: NSTextField = {
        var textField = NSTextField(labelWithString: "Don't have an account? ")
        textField.font = .systemFont(ofSize: 14)
        textField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textField)
        return textField
    }()
    
    lazy var signInOrSignUpButton: NSButton = {
        var button = NSButton()
        button.font = .systemFont(ofSize: 14)
        button.contentTintColor = .controlAccentColor
        button.title = "SignUp"
//        button.alternateTitle = "LogIn"
//        button.setButtonType(.toggle)
        button.target = self
        button.action = #selector(signInOrSignUpButtonAction)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isBordered = false
        addSubview(button)
        return button
    }()
    
    public override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        self.layer?.backgroundColor = NSColor.controlBackgroundColor.cgColor
    }
    
    init(logInFormView: LogInFormView, signUpFormView: SignUpFormView) {
        self.logInFormView = logInFormView
        self.signUpFormView = signUpFormView
//        formView = logInFormView
        
        super.init(frame: NSZeroRect)
        
        self.wantsLayer = true
        
        logInFormView.translatesAutoresizingMaskIntoConstraints = false
        signUpFormView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(logInFormView)
//        addSubview(signUpFormView)
        
        NSLayoutConstraint.activate([
            logInFormView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            logInFormView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            logInFormView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logInFormView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            signInOrSignUpButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            signInOrSignUpButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            instructionTextField.trailingAnchor.constraint(equalTo: signInOrSignUpButton.leadingAnchor),
            instructionTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
    }
    
    @objc func signInOrSignUpButtonAction(_ sender: NSButton) {
        if sender.title == "SignUp" && signInOrSignUpButton.title == "SignUp" {
            logInFormView.removeFromSuperview()
            addSubview(signUpFormView)
            signInOrSignUpButton.title = "LogIn"
            instructionTextField.stringValue = "Already having an account? "
            
            signUpFormView.passwordField.stringValue = ""
            signUpFormView.emailIDField.stringValue = ""
            signUpFormView.nameField.stringValue = ""
            signUpFormView.mobileNumberField.stringValue = ""
            signUpFormView.confirmPasswordField.stringValue = ""
            
            NSLayoutConstraint.deactivate([
                logInFormView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
                logInFormView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
                logInFormView.centerXAnchor.constraint(equalTo: centerXAnchor),
                logInFormView.centerYAnchor.constraint(equalTo: centerYAnchor),
                
                signInOrSignUpButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
                signInOrSignUpButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
                
                instructionTextField.trailingAnchor.constraint(equalTo: signInOrSignUpButton.leadingAnchor),
                instructionTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            ])
            
            NSLayoutConstraint.activate([
                signUpFormView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
                signUpFormView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
                signUpFormView.centerXAnchor.constraint(equalTo: centerXAnchor),
                signUpFormView.centerYAnchor.constraint(equalTo: centerYAnchor),
                
                signInOrSignUpButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
                signInOrSignUpButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
                
                instructionTextField.trailingAnchor.constraint(equalTo: signInOrSignUpButton.leadingAnchor),
                instructionTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            ])
        } else {
            signUpFormView.removeFromSuperview()
            addSubview(logInFormView)
            sender.title = "SignUp"
            instructionTextField.stringValue = "Don't have an account? "
            
            logInFormView.emailIDField.stringValue = ""
            logInFormView.passwordField.stringValue = ""
            
            NSLayoutConstraint.deactivate([
                signUpFormView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
                signUpFormView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
                signUpFormView.centerXAnchor.constraint(equalTo: centerXAnchor),
                signUpFormView.centerYAnchor.constraint(equalTo: centerYAnchor),
                
                signInOrSignUpButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
                signInOrSignUpButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
                
                instructionTextField.trailingAnchor.constraint(equalTo: signInOrSignUpButton.leadingAnchor),
                instructionTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            ])
            
            NSLayoutConstraint.activate([
                logInFormView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
                logInFormView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
                logInFormView.centerXAnchor.constraint(equalTo: centerXAnchor),
                logInFormView.centerYAnchor.constraint(equalTo: centerYAnchor),
                
                signInOrSignUpButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
                signInOrSignUpButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
                
                instructionTextField.trailingAnchor.constraint(equalTo: signInOrSignUpButton.leadingAnchor),
                instructionTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            ])
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
