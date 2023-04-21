//
//  SignUpFormView.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 30/03/23.
//

import Cocoa

class SignUpFormView : NSView {
    lazy var logo: NSImageView = {
        var imageView = NSImageView()
        imageView.image = NSImage(named: "logo1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        return imageView
    }()
    
    lazy var registerLabel: NSTextField = {
        var textLabel = NSTextField(labelWithString: "Create an account")
        textLabel.font = .boldSystemFont(ofSize: 24)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textLabel)
        return textLabel
    }()
    
    lazy var nameLabel: NSTextField = {
        var textLabel = NSTextField(labelWithString: "Full Name")
        textLabel.font = .systemFont(ofSize: 15)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textLabel)
        return textLabel
    }()
    
    lazy var emailIDLabel: NSTextField = {
        var textLabel = NSTextField(labelWithString: "Email Address")
        textLabel.font = .systemFont(ofSize: 15)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textLabel)
        return textLabel
    }()
    
    lazy var mobileNumberLabel: NSTextField = {
        var textLabel = NSTextField(labelWithString: "Mobile Number")
        textLabel.font = .systemFont(ofSize: 15)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textLabel)
        return textLabel
    }()
    
    lazy var passwordLabel: NSTextField = {
        var textLabel = NSTextField(labelWithString: "Password")
        textLabel.font = .systemFont(ofSize: 15)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textLabel)
        return textLabel
    }()
    
    lazy var confirmPasswordLabel: NSTextField = {
        var textLabel = NSTextField(labelWithString: "Confirm Password")
        textLabel.font = .systemFont(ofSize: 15)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textLabel)
        return textLabel
    }()
    
    lazy var nameField: NSTextField = {
        var textField = NSTextField()
        textField.placeholderString = "Enter your name"
        textField.font = .systemFont(ofSize: 17)
        textField.wantsLayer = true
        textField.layer?.borderColor = .clear
        textField.layer?.borderWidth = 1
        textField.focusRingType = .none
        textField.bezelStyle = .roundedBezel
        textField.nextKeyView = emailIDField
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textField)
        return textField
    }()
    
    lazy var emailIDField: NSTextField = {
        var textField = NSTextField()
        textField.placeholderString = "Enter your eMail address"
        textField.font = .systemFont(ofSize: 17)
        textField.wantsLayer = true
        textField.layer?.borderColor = .clear
        textField.layer?.borderWidth = 1
        textField.focusRingType = .none
        textField.bezelStyle = .roundedBezel
        textField.nextKeyView = mobileNumberField
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textField)
        return textField
    }()
    
    lazy var mobileNumberField: NSTextField = {
        var textField = NSTextField()
        textField.placeholderString = "Enter your Mobile Number"
        textField.font = .systemFont(ofSize: 17)
        textField.formatter = Formatter.mobileNumberFormatter
        textField.wantsLayer = true
        textField.layer?.borderColor = .clear
        textField.layer?.borderWidth = 1
        textField.focusRingType = .none
        textField.bezelStyle = .roundedBezel
        textField.nextKeyView = passwordField
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textField)
        return textField
    }()
    
    lazy var passwordField: NSSecureTextField = {
        var textField = NSSecureTextField()
//        textField = (textField as? NSSecureTextField) ?? NSSecureTextField()
        var cell = textField.cell as? NSSecureTextFieldCell
//        cell?.echosBullets = true
//        textField
        textField.placeholderString = "Enter your password"
        textField.font = .systemFont(ofSize: 17)
        textField.wantsLayer = true
        textField.layer?.borderColor = .clear
        textField.layer?.borderWidth = 1
        textField.focusRingType = .none
        textField.bezelStyle = .roundedBezel
        textField.nextKeyView = confirmPasswordField
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textField)
        return textField
    }()
    
    lazy var confirmPasswordField: NSSecureTextField = {
        var textField = NSSecureTextField()
//        textField = (textField as? NSSecureTextField) ?? NSSecureTextField()
        var cell = textField.cell as? NSSecureTextFieldCell
//        cell?.echosBullets = true
//        textField
        textField.placeholderString = "Confirm password"
        textField.font = .systemFont(ofSize: 17)
        textField.wantsLayer = true
        textField.layer?.borderColor = .clear
        textField.layer?.borderWidth = 1
        textField.focusRingType = .none
        textField.bezelStyle = .roundedBezel
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textField)
        return textField
    }()
    
    lazy var signUpButton: NSButton = {
        var button = NSButton()
        button.font = NSFont(name: "Big Caslon", size: 15)
        button.title = "SignUp"
        button.contentTintColor = .white
        button.wantsLayer = true
        button.isBordered = false
        button.layer?.backgroundColor = NSColor.controlAccentColor.cgColor
        button.layer?.cornerRadius  = 15
        button.target = self
        button.action = #selector(signUp)
        button.translatesAutoresizingMaskIntoConstraints = false
        addSubview(button)
        return button
    }()
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        NSLayoutConstraint.activate([
            logo.topAnchor.constraint(equalTo: topAnchor),
            logo.heightAnchor.constraint(equalToConstant: 62),
            logo.widthAnchor.constraint(equalToConstant: 150),
            logo.bottomAnchor.constraint(equalTo: registerLabel.topAnchor, constant: -20),
            logo.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            registerLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            registerLabel.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -20),
            
            nameLabel.leadingAnchor.constraint(equalTo: nameField.leadingAnchor, constant: 3),
            nameLabel.bottomAnchor.constraint(equalTo: nameField.topAnchor, constant: -3),
            
//            nameField.topAnchor.constraint(equalTo: topAnchor),
//            nameField.leadingAnchor.constraint(lessThanOrEqualTo: leadingAnchor),
//            nameField.trailingAnchor.constraint(greaterThanOrEqualTo: trailingAnchor),
            nameField.bottomAnchor.constraint(equalTo: emailIDLabel.topAnchor, constant: -20),
            nameField.heightAnchor.constraint(equalToConstant: 35),
            nameField.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameField.widthAnchor.constraint(equalToConstant: 450),
            
            emailIDLabel.leadingAnchor.constraint(equalTo: emailIDField.leadingAnchor, constant: 3),
            emailIDLabel.bottomAnchor.constraint(equalTo: emailIDField.topAnchor, constant: -3),
            
//            emailIDField.leadingAnchor.constraint(equalTo: leadingAnchor),
//            emailIDField.trailingAnchor.constraint(equalTo: trailingAnchor),
            emailIDField.bottomAnchor.constraint(equalTo: mobileNumberLabel.topAnchor, constant: -20),
            emailIDField.heightAnchor.constraint(equalToConstant: 35),
//            emailIDField.widthAnchor.constraint(greaterThanOrEqualToConstant: 200),
            emailIDField.centerXAnchor.constraint(equalTo: centerXAnchor),
            emailIDField.widthAnchor.constraint(equalToConstant: 450),
            
            mobileNumberLabel.leadingAnchor.constraint(equalTo: mobileNumberField.leadingAnchor, constant: 3),
            mobileNumberLabel.bottomAnchor.constraint(equalTo: mobileNumberField.topAnchor, constant: -3),
            
//            mobileNumberField.leadingAnchor.constraint(equalTo: leadingAnchor),
//            mobileNumberField.trailingAnchor.constraint(equalTo: trailingAnchor),
            mobileNumberField.bottomAnchor.constraint(equalTo: passwordLabel.topAnchor, constant: -20),
            mobileNumberField.heightAnchor.constraint(equalToConstant: 35),
//            mobileNumberField.widthAnchor.constraint(greaterThanOrEqualToConstant: 200),
            mobileNumberField.centerXAnchor.constraint(equalTo: centerXAnchor),
            mobileNumberField.widthAnchor.constraint(equalToConstant: 450),

            passwordLabel.leadingAnchor.constraint(equalTo: passwordField.leadingAnchor, constant: 3),
            passwordLabel.bottomAnchor.constraint(equalTo: passwordField.topAnchor, constant: -3),

//            passwordField.leadingAnchor.constraint(equalTo: leadingAnchor),
//            passwordField.trailingAnchor.constraint(equalTo: trailingAnchor),
            passwordField.bottomAnchor.constraint(equalTo: confirmPasswordLabel.topAnchor, constant: -20),
            passwordField.heightAnchor.constraint(equalToConstant: 35),
//            passwordField.widthAnchor.constraint(greaterThanOrEqualToConstant: 200),
            passwordField.centerXAnchor.constraint(equalTo: centerXAnchor),
            passwordField.widthAnchor.constraint(equalToConstant: 450),

            confirmPasswordLabel.leadingAnchor.constraint(equalTo: confirmPasswordField.leadingAnchor, constant: 3),
            confirmPasswordLabel.bottomAnchor.constraint(equalTo: confirmPasswordField.topAnchor, constant: -3),

//            confirmPasswordField.leadingAnchor.constraint(equalTo: leadingAnchor),
//            confirmPasswordField.trailingAnchor.constraint(equalTo: trailingAnchor),
            confirmPasswordField.bottomAnchor.constraint(equalTo: signUpButton.topAnchor, constant: -40),
            confirmPasswordField.heightAnchor.constraint(equalToConstant: 35),
//            confirmPasswordField.widthAnchor.constraint(greaterThanOrEqualToConstant: 200),
            confirmPasswordField.centerXAnchor.constraint(equalTo: centerXAnchor),
            confirmPasswordField.widthAnchor.constraint(equalToConstant: 450),

            signUpButton.heightAnchor.constraint(equalToConstant: 30),
            signUpButton.widthAnchor.constraint(equalToConstant: 100),
            signUpButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            signUpButton.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func signUp() {
        var flag = false
        if nameField.stringValue == "" {
            nameField.layer?.borderColor = NSColor.red.cgColor
            flag = true
        }
        if mobileNumberField.stringValue == "" {
            mobileNumberField.layer?.borderColor = NSColor.red.cgColor
            flag = true
        }
        if emailIDField.stringValue == "" {
            emailIDField.layer?.borderColor = NSColor.red.cgColor
            flag = true
        }
        if passwordField.stringValue == "" {
            passwordField.layer?.borderColor = NSColor.red.cgColor
            flag = true
        }
        if mobileNumberField.stringValue.count != 10 {
            mobileNumberField.layer?.borderColor = NSColor.red.cgColor
            flag = true
        }
        if confirmPasswordField.stringValue == "" {
            confirmPasswordField.layer?.borderColor = NSColor.red.cgColor
            flag = true
        }
        if mobileNumberField.stringValue.count != 10 {
            mobileNumberField.layer?.borderColor = NSColor.red.cgColor
            flag = true
        }
        if confirmPasswordField.stringValue != passwordField.stringValue{
            passwordField.layer?.borderColor = NSColor.red.cgColor
            confirmPasswordField.layer?.borderColor = NSColor.red.cgColor
            flag = true
        }
//        print(flag)
        if flag == false {
            let user = User(id: "-1", name: nameField.stringValue, phoneNumber: Int64(mobileNumberField.stringValue) ?? 0, emailID: emailIDField.stringValue, password: passwordField.stringValue, userType: UserType.Customer)
            (superview?.superview as? AuthenticationView)?.presenter.addNewUser(user: user)
            (superview as? AuthenticationPageFormContainerView)?.signInOrSignUpButtonAction(signUpButton)
        }
    }
}

extension SignUpFormView: NSTextFieldDelegate {
//    func controlTextDidEndEditing(_ obj: Notification) {
//        if let textField = obj.object as? NSTextField {
//            if textField.currentEditor()?.string.isEmpty == false {
//                signUp()
//            }
//        }
//    }
    
    func controlTextDidChange(_ obj: Notification) {
        if let textField = obj.object as? NSTextField {
            textField.layer?.borderColor = .clear
        }
    }
}
