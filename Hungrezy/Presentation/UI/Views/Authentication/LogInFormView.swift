//
//  LogInFormView.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 01/04/23.
//

import Cocoa

class LogInFormView : NSView {
    lazy var logo: NSImageView = {
        var imageView = NSImageView()
        imageView.image = NSImage(named: "logo1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        return imageView
    }()
    
    lazy var logInLabel: NSTextField = {
        var textLabel = NSTextField(labelWithString: "Hello, Foodie. LogIn to continue")
        textLabel.font = .boldSystemFont(ofSize: 24)
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
    
    lazy var passwordLabel: NSTextField = {
        var textLabel = NSTextField(labelWithString: "Password")
        textLabel.font = .systemFont(ofSize: 15)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textLabel)
        return textLabel
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
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textField)
        return textField
    }()
    
    lazy var eyeImage: NSButton = {
        var button = NSButton()
        button.image = NSImage(systemSymbolName: "eye", accessibilityDescription: nil)
        button.alternateImage = NSImage(systemSymbolName: "eye.slash", accessibilityDescription: nil)
        button.imageScaling  = .scaleProportionallyUpOrDown
        button.isBordered = false
        button.setButtonType(.toggle)
        button.target = self
        button.action = #selector(showOrHidePassword)
        button.translatesAutoresizingMaskIntoConstraints = false
        passwordField.addSubview(button)
        return button
    }()
    
//    lazy var eyeImageClosed: NSImageView = {
//        var imageView = NSImageView()
//        imageView.image = NSImage(systemSymbolName: "eye.slash", accessibilityDescription: nil)
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        passwordField.addSubview(imageView)
//        return imageView
//    }()
    
    lazy var logInButton: NSButton = {
        var button = NSButton()
        button.font = NSFont(name: "Big Caslon", size: 15)
        button.title = "LogIn"
        button.contentTintColor = .white
        button.wantsLayer = true
        button.isBordered = false
        button.layer?.backgroundColor = NSColor.controlAccentColor.cgColor
        button.layer?.cornerRadius  = 15
        button.target = self
        button.action = #selector(logIn)
        button.translatesAutoresizingMaskIntoConstraints = false
        addSubview(button)
        return button
    }()
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        window?.makeFirstResponder(self)
        
        NSLayoutConstraint.activate([
            logo.topAnchor.constraint(equalTo: topAnchor),
            logo.heightAnchor.constraint(equalToConstant: 62),
            logo.widthAnchor.constraint(equalToConstant: 150),
            logo.bottomAnchor.constraint(equalTo: logInLabel.topAnchor, constant: -20),
            logo.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            logInLabel.leadingAnchor.constraint(equalTo: emailIDField.leadingAnchor),
            logInLabel.bottomAnchor.constraint(equalTo: emailIDLabel.topAnchor, constant: -20),
                        
            emailIDLabel.leadingAnchor.constraint(equalTo: emailIDField.leadingAnchor, constant: 3),
            emailIDLabel.bottomAnchor.constraint(equalTo: emailIDField.topAnchor, constant: -3),
            
//            emailIDField.leadingAnchor.constraint(equalTo: leadingAnchor),
//            emailIDField.trailingAnchor.constraint(equalTo: trailingAnchor),
            emailIDField.bottomAnchor.constraint(equalTo: passwordLabel.topAnchor, constant: -20),
            emailIDField.heightAnchor.constraint(equalToConstant: 35),
//            emailIDField.widthAnchor.constraint(greaterThanOrEqualToConstant: 200),
            emailIDField.centerXAnchor.constraint(equalTo: centerXAnchor),
            emailIDField.widthAnchor.constraint(equalToConstant: 450),
            
            passwordLabel.leadingAnchor.constraint(equalTo: passwordField.leadingAnchor, constant: 3),
            passwordLabel.bottomAnchor.constraint(equalTo: passwordField.topAnchor, constant: -3),

//            passwordField.leadingAnchor.constraint(equalTo: leadingAnchor),
//            passwordField.trailingAnchor.constraint(equalTo: trailingAnchor),
            passwordField.bottomAnchor.constraint(equalTo: logInButton.topAnchor, constant: -40),
            passwordField.heightAnchor.constraint(equalToConstant: 35),
//            passwordField.widthAnchor.constraint(greaterThanOrEqualToConstant: 200),
            passwordField.centerXAnchor.constraint(equalTo: centerXAnchor),
            passwordField.widthAnchor.constraint(equalToConstant: 450),

//            eyeImage.heightAnchor.constraint(equalToConstant: 25),
//            eyeImage.widthAnchor.constraint(equalToConstant: 25),
            
//            passwordField.trailingAnchor.constraint(equalTo: eyeImage.trailingAnchor, constant: 10),
//            passwordField.centerYAnchor.constraint(equalTo: eyeImage.centerYAnchor),

            logInButton.heightAnchor.constraint(equalToConstant: 30),
            logInButton.widthAnchor.constraint(equalToConstant: 100),
            logInButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            logInButton.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func logIn() {
        var flag = false
        if emailIDField.stringValue == "" {
            emailIDField.layer?.borderColor = NSColor.red.cgColor
            flag = true
        }
        if passwordField.stringValue == "" {
            passwordField.layer?.borderColor = NSColor.red.cgColor
            flag = true
        }
        
        if flag == false {
            (superview?.superview as? AuthenticationView)?.presenter.authenticateUser(emailID: emailIDField.stringValue, password: passwordField.stringValue)
        }
    }
    
    @objc func showOrHidePassword(_ sender: NSButton) {
//        if (passwordField.cell as? NSSecureTextFieldCell)?.echosBullets == true {
//            (passwordField.cell as? NSSecureTextFieldCell)?.echosBullets = false
//        } else {
//            (passwordField.cell as? NSSecureTextFieldCell)?.echosBullets = true
//        }
//        (passwordField.cell as? NSSecureTextFieldCell)?.echosBullets.toggle()
//        print((passwordField.cell as? NSSecureTextFieldCell)?.echosBullets)
    }
    
    override var acceptsFirstResponder: Bool {
        return true
    }
    
//    override func keyDown(with event: NSEvent) {
//        print(1)
//        print(event.keyCode)
//        if event.keyCode == 36 {
//            print(1)
//            logIn()
//        } else {
//            super.keyDown(with: event)
//        }
//    }
}

extension LogInFormView: NSTextFieldDelegate {
//    func controlTextDidEndEditing(_ obj: Notification) {
//        if let textField = obj.object as? NSTextField {
//            if textField.currentEditor()?.string.isEmpty == false {
//                logIn()
//            }
//        }
//    }
    
    func controlTextDidChange(_ obj: Notification) {
        if let textField = obj.object as? NSTextField {
            textField.layer?.borderColor = .clear
        }
    }
}
