//
//  LoginViewController.swift
//  TwitterClient
//
//  Created by Ashraf Abu Bakr on 1/24/18.
//  Copyright © 2018 Eventtus. All rights reserved.
//

import UIKit
import TwitterKit

class LoginViewController: UIViewController {

	@IBOutlet weak var logoView: UIView!
	@IBOutlet weak var twitterLoginButton: TWTRLogInButton!
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		navigationController?.isNavigationBarHidden = true
    }
	
	override func viewDidAppear(_ animated: Bool) {
		initUI()
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


//MARK: - Animations
extension LoginViewController {
	
	func initUI() {
		showLogoView()
		if !TwitterHandler.isLoggedIn() {
			_ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false, block: { [weak self] (timer) in
				self?.showLoginButton()
			})
		}
	}
	
	func showLogoView() {
		UIView.animate(withDuration: 0.3) { [weak self] in
			self?.logoView.alpha = 1.0
		}
	}
	
	func showLoginButton() {
		
		twitterLoginButton.logInCompletion = {(session, error) in
			if error == nil {
				print("Logged In")
			} else {
				print("Error: \(error?.localizedDescription)")
			}
		}
		UIView.animate(withDuration: 0.3) { [weak self] in
			self?.twitterLoginButton.alpha = 1.0
		}
	}
}
