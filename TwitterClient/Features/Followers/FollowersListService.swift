//
//  FollowersListService.swift
//  TwitterClient
//
//  Created by Ashraf Abu Bakr on 1/25/18.
//  Copyright © 2018 Eventtus. All rights reserved.
//

import UIKit

class FollowersListService: NSObject {
	
	var followersListObject: FollowersListModel?
	
	func getFollowersList(withCompletion completion: @escaping FollowersCompletionClosure) {
		TwitterHandler.getFollowers(withCursor: nil) {[weak self] (responseObject, error) in
			if error == nil {
				completion(responseObject, nil)
				self?.followersListObject = responseObject as? FollowersListModel
			} else {
				completion(nil, error)
			}
		}
	}

}
