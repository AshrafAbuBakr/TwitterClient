//
//  FollowerModel.swift
//  TwitterClient
//
//  Created by Ashraf Abu Bakr on 1/25/18.
//  Copyright © 2018 Eventtus. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift
import ObjectMapper_Realm

class FollowersModel: Object, Mappable {
	
	@objc dynamic var id_str: String?
	@objc dynamic var name: String = ""
	@objc dynamic var screen_name: String = ""
	@objc dynamic var followers_count: Int = 0
	@objc dynamic var friends_count: Int = 0
	@objc dynamic var profile_background_image_url_https: String?
	@objc dynamic var profile_image_url_https: String?
	@objc dynamic var bio: String?
	@objc dynamic var profile_background_color: String?
	
	required convenience init?(map: Map) {
		self.init()
	}
	
	//Used "next_cursor" as there will only be one item at any time.
	override class func primaryKey() -> String? {
		return "id_str"
	}
	
	func mapping(map: Map) {
		id_str <- map["id_str"]
		name <- map["name"]
		screen_name <- map["screen_name"]
		followers_count <- map["followers_count"]
		profile_background_image_url_https <- map["profile_background_image_url_https"]
		profile_image_url_https <- map["profile_image_url_https"]
		bio <- map["description"]
		profile_background_color <- map["profile_background_color"]
	}

}
