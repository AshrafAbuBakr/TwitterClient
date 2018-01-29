//
//  FollowerDetailsService.swift
//  TwitterClient
//
//  Created by Ashraf Abu Bakr on 1/28/18.
//  Copyright © 2018 Eventtus. All rights reserved.
//

import UIKit
import Reachability

class FollowerDetailsService: NSObject {

	let reachability: Reachability = Reachability()!
	var tweets: [tweetModel]?
	
	func getFollowerTweets(forScreenName screenName: String, andCompletion completion: @escaping TweetsCompletionClosure) {
		
		if reachability.connection != .none  {
			TwitterHandler.getTweets(withscreenName: screenName) {[weak self] (tweets, error) in
				if error == nil {
					completion(tweets, nil)
					self?.tweets = tweets
					RealmHandler.saveTweets(tweets!)
				} else {
					completion(nil, error)
				}
			}
		} else {
			if let _ = TwitterHandler.curretUserID() {
				if let responseObject = RealmHandler.getSavedTweets(forScreenName: screenName) {
					completion(responseObject, nil)
				}
			}
			
		}
	}
}
