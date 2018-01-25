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
			
			if let model: FollowersListModel = Mapper<FollowersListModel>().map(JSONObject: data, toObject: FollowersListModel()) {
				completion(model, nil)
			}
			
			do {
				let json = try JSONSerialization.jsonObject(with: data!, options: [])
				print("json: \(json)")
			} catch let jsonError as NSError {
				print("json error: \(jsonError.localizedDescription)")
			}
		}
	}
}
