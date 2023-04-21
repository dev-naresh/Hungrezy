//
//  HomeView.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 06/04/23.
//

import Cocoa

class HomeView : NSVisualEffectView {
    var user: User
    var sideView: ModuleView
    
    lazy var contentView: NSView = {
        let view = NSView()
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }()
    
    init(user: User, frame frameRect: NSRect, sideView: ModuleView) {
        self.user = user
        self.sideView = sideView
        super.init(frame: frameRect)
        
        sideView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(sideView)
        
        NSLayoutConstraint.activate([
            sideView.topAnchor.constraint(equalTo: topAnchor),
            sideView.leadingAnchor.constraint(equalTo: leadingAnchor),
            sideView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            sideView.trailingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -10),
            contentView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])

    }
    
    func setConstrints() {
        NSLayoutConstraint.deactivate([
            sideView.topAnchor.constraint(equalTo: topAnchor),
            sideView.leadingAnchor.constraint(equalTo: leadingAnchor),
            sideView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            sideView.trailingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -10),
            contentView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
        
        NSLayoutConstraint.activate([
            sideView.topAnchor.constraint(equalTo: topAnchor),
            sideView.leadingAnchor.constraint(equalTo: leadingAnchor),
            sideView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            sideView.trailingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -10),
            contentView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
