//
//  tweetModel.swift
//  TwitterClient
//
//  Created by Ashraf Abu Bakr on 1/28/18.
//  Copyright © 2018 Eventtus. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift
import ObjectMapper_Realm
import TwitterKit

typealias TweetsCompletionClosure = ([tweetModel]?, Error?) -> Void

class tweetModel: Object, Mappable {

	@objc dynamic var id_str: String?
	@objc dynamic var text: String?
	@objc dynamic var userScreenName: String?
	
	required convenience init?(map: Map) {
		self.init()
	}
	
	override class func primaryKey() -> String? {
		return "id_str"
	}
	
	func mapping(map: Map) {
		id_str <- map["id_str"]
		text <- map["text"]
		userScreenName <- map["userScreenName"]
	}
}
