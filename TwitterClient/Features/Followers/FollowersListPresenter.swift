//
//  FollowersListPresenter.swift
//  TwitterClient
//
//  Created by Ashraf Abu Bakr on 1/25/18.
//  Copyright © 2018 Eventtus. All rights reserved.
//

import UIKit

typealias FollowersCompletionClosure = (FollowersListModel?, Error?) -> Void

class FollowersListPresenter: NSObject {
	
	var service: FollowersListService?
	weak var view: FollowersListViewController?
	
	override init() {
		super.init()
		service = FollowersListService()
	}
	
	init(withView view: FollowersListViewController) {
		super.init()
		service = FollowersListService()
		self.view = view
	}
	
	func getFollowersList() {
		service?.getFollowersList(withCompletion: {[weak self] (responseObject, error) in
			if error == nil {
				self?.view?.setupFollowersTable(withFollowers: (responseObject?.users)!)
				print("Success")
			} else {
				print("Failure")
			}
		})
	}
}
