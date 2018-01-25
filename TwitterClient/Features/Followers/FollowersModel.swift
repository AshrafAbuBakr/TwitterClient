//
//  FollowerModel.swift
//  TwitterClient
//
//  Created by Ashraf Abu Bakr on 1/25/18.
//  Copyright © 2018 Eventtus. All rights reserved.
//

import UIKit
import ObjectMapper

class FollowersModel: Mappable {
	
	var id_str: String?
	var name: String = ""
	var screen_name: String = ""
	var followers_count: Int = 0
	var friends_count: Int = 0
	var profile_background_image_url_https: String?
	var profile_image_url_https: String?
	var bio: String?
	
	required init?(map: Map) {
		
	}
	
	init() {
		
	}
	
	func mapping(map: Map) {
		id_str <- map["id_str"]
		name <- map["name"]
		screen_name <- map["screen_name"]
		followers_count <- map["followers_count"]
		profile_background_image_url_https <- map["profile_background_image_url_https"]
		profile_image_url_https <- map["profile_image_url_https"]
		bio <- map["description"]
	}

}
