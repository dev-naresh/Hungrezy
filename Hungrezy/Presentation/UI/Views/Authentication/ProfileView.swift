//
//  ProfileView.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 06/04/23.
//

import Cocoa

class ProfileView: NSView {
    var presenter: ProfileViewPresenterContract
    let name: String
    let mailID: String

    lazy var profilePicture: NSImageView = {
        var imageView = NSImageView()
        var image = NSImage(systemSymbolName: "person", accessibilityDescription: nil)
        imageView.image = image
        imageView.wantsLayer = true
        imageView.layer?.cornerRadius = 45
        imageView.layer?.borderWidth = 2
        imageView.layer?.borderColor = NSColor.controlAccentColor.cgColor
        imageView.layer?.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        return imageView
    }()
    
    lazy var nameLabel: NSTextField = {
        var textLabel = NSTextField(labelWithString: name)
        textLabel.font = .boldSystemFont(ofSize: 14)
        textLabel.lineBreakMode = .byTruncatingMiddle
        textLabel.alignment = .center
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textLabel)
        return textLabel
    }()
    
    lazy var mailIDLabel: NSTextField = {
        var textLabel = NSTextField(labelWithString: mailID)
        textLabel.font = .systemFont(ofSize: 12)
        textLabel.lineBreakMode = .byTruncatingMiddle
        textLabel.alignment = .center
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textLabel)
        return textLabel
    }()
    
    lazy var logOutButton: NSButton = {
        var button = NSButton()
        button.title = "LogOut"
//        button.bezelStyle = .inline
        button.isBordered = false
        button.wantsLayer = true
        button.layer?.cornerRadius = 15
        button.layer?.backgroundColor = NSColor.controlAccentColor.cgColor
        button.contentTintColor = .white
        button.target = self
        button.action = #selector(logOut)
        button.translatesAutoresizingMaskIntoConstraints = false
        addSubview(button)
        return button
    }()
    
    init(name: String, mailID: String, presenter: ProfileViewPresenterContract) {
        self.name = name
        self.mailID = mailID
        self.presenter = presenter
        super.init(frame: NSRect(x: 0, y: 0, width: 150, height: 150))
        
        NSLayoutConstraint.activate([
            profilePicture.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            profilePicture.centerXAnchor.constraint(equalTo: centerXAnchor),
            profilePicture.heightAnchor.constraint(equalToConstant: 90),
            profilePicture.widthAnchor.constraint(equalToConstant: 90),
            profilePicture.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -10),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: mailIDLabel.topAnchor, constant: -3),
            mailIDLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            mailIDLabel.widthAnchor.constraint(equalToConstant: 175),
            nameLabel.widthAnchor.constraint(equalToConstant: 175),
            mailIDLabel.bottomAnchor.constraint(equalTo: logOutButton.topAnchor, constant: -15),
            logOutButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            logOutButton.heightAnchor.constraint(equalToConstant: 30),
            logOutButton.widthAnchor.constraint(equalToConstant: 75),
            
            heightAnchor.constraint(equalToConstant: 220),
            widthAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProfileView {
    @objc func logOut(sender: NSButton) {
        presenter.logOutUser()
    }
}

extension ProfileView: ProfileViewContract {
    
}
