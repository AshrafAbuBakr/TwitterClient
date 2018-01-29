//
//  FollowerDetailsPresenter.swift
//  TwitterClient
//
//  Created by Ashraf Abu Bakr on 1/28/18.
//  Copyright © 2018 Eventtus. All rights reserved.
//

import UIKit

class FollowerDetailsPresenter: NSObject {
	
	var service: FollowerDetailsService?
	weak var view: FollowerDetailsViewController?
	
	override init() {
		super.init()
		service = FollowerDetailsService()
	}
	
	init(withView view: FollowerDetailsViewController) {
		super.init()
		service = FollowerDetailsService()
		self.view = view
	}
	
	func getFollowerTweets(forScreenName screenName: String) {
		service?.getFollowerTweets(forScreenName: screenName, andCompletion: {[weak self] (tweets, error) in
			if error == nil {
				self?.view?.setupTweetsTableView(withTweets: tweets!)
			}
			
			
		})
		
	}

}
