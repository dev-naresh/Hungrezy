//
//  AuthenticationViewController.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 04/04/23.
//

import Cocoa

class AuthenticationViewController : NSViewController {
    var router: AuthenticationRouterContract
    var timer: Timer?
    let images = [NSImage(named: "signup2"), NSImage(named: "signup3"), NSImage(named: "signup1")]
    let quotes = ["Straight out of the kitchen to your doorstep", "Hot, tasty food to your destination in 20mins", "Filling your tummy on time is what we care about"]
    var n = 1

    init(router: AuthenticationRouterContract, view: AuthenticationView) {
        self.router = router
        super.init(nibName: nil, bundle: nil)
        self.view = view
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()

        timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { [weak self] timer in
            print("Timer fired!")

            (self?.view as? AuthenticationView)?.leftView.image.image = self?.images[self?.n ?? 0]
            (self?.view as? AuthenticationView)?.leftView.quote.stringValue = self?.quotes[self?.n ?? 0] ?? ""
//            self?.window?.contentView = nil
            self?.n += 1
            if self?.n ?? 0 > 2 {
                self?.n = 0
            }
        }
    }

    override func viewDidDisappear() {
        super.viewDidDisappear()

        timer?.invalidate()
    }
}
