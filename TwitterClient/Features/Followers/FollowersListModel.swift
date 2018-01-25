//
//  FollowersListModel.swift
//  TwitterClient
//
//  Created by Ashraf Abu Bakr on 1/25/18.
//  Copyright © 2018 Eventtus. All rights reserved.
//

import UIKit
import ObjectMapper

class FollowersListModel: Mappable {
	
	var users: [FollowersModel]?
	var next_cursor: Int?
	var next_cursor_str: String = ""
	var previous_cursor: Int?
	var previous_cursor_str: String = ""
	
	required init?(map: Map) {
		
	}
	
	init() {
		
	}
	
	func mapping(map: Map) {
		users <- map["users"]
		next_cursor <- map["next_cursor"]
		next_cursor_str <- map["next_cursor_str"]
		previous_cursor <- map["previous_cursor"]
		previous_cursor_str <- map["previous_cursor_str"]
	}

}
