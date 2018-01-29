//
//  TwitterHandler.swift
//  TwitterClient
//
//  Created by Ashraf Abu Bakr on 1/25/18.
//  Copyright © 2018 Eventtus. All rights reserved.
//

import Foundation
import TwitterKit
import ObjectMapper

class TwitterHandler: NSObject {
	
	class func curretUserID() -> String? {
		guard TWTRTwitter.sharedInstance().sessionStore.session()?.userID != nil else {
			return nil
		}
		return TWTRTwitter.sharedInstance().sessionStore.session()?.userID
	}
	
	/// Checks if user has an active session or if login is needed.
	///
	/// - Returns: Bool - Returns true if there is an active session and login is not needed.
	class func isLoggedIn() -> Bool {
		if let _ = TWTRTwitter.sharedInstance().sessionStore.session()?.userID {
			//User Already has an active session.
			return true
		}
		return false
	}
	
	class func getFollowers(withCursor cursor: String? = "-1", andCompletion completion:@escaping FollowersCompletionClosure) {
		let client = TWTRAPIClient(userID: TWTRTwitter.sharedInstance().sessionStore.session()?.userID)
		let followersRequest = "https://api.twitter.com/1.1/followers/list.json?cursor=-1"
		var clientError : NSError?
		
		let request = client.urlRequest(withMethod: "GET", urlString: followersRequest, parameters: nil, error: &clientError)
		
		client.sendTwitterRequest(request) { (response, data, connectionError) -> Void in
			if connectionError != nil {
				completion(nil, connectionError)
			}
			
			do {
				if var json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any] {
					json["userID"] = TwitterHandler.curretUserID()
					if let model: FollowersListModel = Mapper<FollowersListModel>().map(JSONObject: json, toObject: FollowersListModel()) {
						completion(model, nil)
					}
				}
			} catch let jsonError as NSError {
				print("json error: \(jsonError.localizedDescription)")
			}
			
			
		}
	}
	
	class func getTweets(withscreenName screenName: String, andCompletion completion:@escaping TweetsCompletionClosure) {
		let client = TWTRAPIClient(userID: TWTRTwitter.sharedInstance().sessionStore.session()?.userID)
		let tweetsRequest = "https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=\(screenName)&count=10"
		var clientError : NSError?
		
		let request = client.urlRequest(withMethod: "GET", urlString: tweetsRequest, parameters: nil, error: &clientError)
		
		client.sendTwitterRequest(request) { (response, data, connectionError) -> Void in
			if connectionError != nil {
				completion(nil, connectionError)
				return
			}
			
			do {
				if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [[String: Any]] {
					var tweets: [tweetModel] = [tweetModel]()
					for var dict in json {
						dict["userScreenName"] = screenName
						if let model: tweetModel = Mapper<tweetModel>().map(JSONObject: dict, toObject: tweetModel()) {
							tweets.append(model)
						}
					}
					completion(tweets, nil)
				}
			} catch let jsonError as NSError {
				print("json error: \(jsonError.localizedDescription)")
				completion(nil, jsonError)
			}
			
			
		}
	}
}
