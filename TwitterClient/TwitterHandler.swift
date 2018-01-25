//
//  TwitterHandler.swift
//  TwitterClient
//
//  Created by Ashraf Abu Bakr on 1/25/18.
//  Copyright © 2018 Eventtus. All rights reserved.
//

import Foundation
import TwitterKit

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
}
