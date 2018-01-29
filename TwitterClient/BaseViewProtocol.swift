//
//  BaseViewProtocol.swift
//  TwitterClient
//
//  Created by Ashraf Abu Bakr on 1/29/18.
//  Copyright © 2018 Eventtus. All rights reserved.
//

import UIKit
import TwitterKit
import NVActivityIndicatorView

protocol BaseViewProtocol: class {
	func showLoadingIndicator()
	func hideLoadingIndicator()
	func showError(withMessage message: String)
}

extension BaseViewProtocol where Self: UIViewController {
	
	func showLoadingIndicator() {
		let activityData = ActivityData()
		NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)
		
	}
	
	func hideLoadingIndicator() {
		NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
	}
	
	func showError(withMessage message: String) {
		let alert: UIAlertController = UIAlertController(title: "Please Note!",
														 message: message,
														 preferredStyle: .alert)
		let action: UIAlertAction = UIAlertAction(title: "OK",
												  style: .destructive,
												  handler: nil)
		alert.addAction(action)
		
		present(alert,
				animated: true,
				completion: nil)
	}
}
