//
//  FollowersListService.swift
//  TwitterClient
//
//  Created by Ashraf Abu Bakr on 1/25/18.
//  Copyright © 2018 Eventtus. All rights reserved.
//

import UIKit
import Reachability


class FollowersListService: NSObject {
	let reachability: Reachability = Reachability()!
	var followersListObject: FollowersListModel?
	
	func getFollowersList(withCompletion completion: @escaping FollowersCompletionClosure) {
		
		if reachability.connection != .none  {
			TwitterHandler.getFollowers(withCursor: nil) {[weak self] (responseObject, error) in
				if error == nil {
					completion(responseObject, nil)
					self?.followersListObject = responseObject
					RealmHandler.saveFollowers(followersListObject: responseObject!)
				} else {
					completion(nil, error)
				}
			}
		} else {
			if let userID = TwitterHandler.curretUserID() {
				if let responseObject = RealmHandler.getSavedFollowers(forUserID: userID) {
					followersListObject = responseObject
					completion(responseObject, nil)
				}
			}
			
		}
	}

}
