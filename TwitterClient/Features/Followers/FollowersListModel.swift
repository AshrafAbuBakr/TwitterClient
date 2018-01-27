//
//  FollowersListModel.swift
//  TwitterClient
//
//  Created by Ashraf Abu Bakr on 1/25/18.
//  Copyright © 2018 Eventtus. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift
import ObjectMapper_Realm
import TwitterKit

class FollowersListModel:Object, Mappable {
	
	var users: List<FollowersModel> = List<FollowersModel>()
	@objc dynamic var next_cursor: Int = -1
	@objc dynamic var next_cursor_str: String = ""
	@objc dynamic var previous_cursor: Int = -1
	@objc dynamic var previous_cursor_str: String = ""
	@objc dynamic var userID: String?
	
	required convenience init?(map: Map) {
		self.init()
	}
	
	override class func primaryKey() -> String? {
		return "userID"
	}
	
	func mapping(map: Map) {
		users <- (map["users"], ListTransform<FollowersModel>())
		next_cursor <- map["next_cursor"]
		next_cursor_str <- map["next_cursor_str"]
		previous_cursor <- map["previous_cursor"]
		previous_cursor_str <- map["previous_cursor_str"]
		previous_cursor_str = "ashraf"
		userID <- map["userID"]
	}
}
