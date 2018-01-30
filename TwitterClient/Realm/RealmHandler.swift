//
//  RealmHandler.swift
//  TwitterClient
//
//  Created by Ashraf Abu Bakr on 1/26/18.
//  Copyright © 2018 Eventtus. All rights reserved.
//

import Foundation
import RealmSwift

class RealmHandler: NSObject {
	
	class func getSavedFollowers(forUserID userID: String) -> FollowersListModel? {
		do {
			let realm = try Realm()
			if let follwersListModel = realm.objects(FollowersListModel.self).filter("userID = '\(userID)'").first {
				return follwersListModel
			}
			return nil
		} catch {
			print(error.localizedDescription)
			return nil
		}
	}
	
	class func saveFollowers(followersListObject follwersList: FollowersListModel) {
		do {
			let realm = try Realm()
			try realm.write {
				realm.add(follwersList, update: true)
			}
		} catch {
			print(error.localizedDescription)
		}
	}
}

//MARK: - Tweets
extension RealmHandler {
	class func getSavedTweets(forScreenName screenName: String) -> [tweetModel]? {
		do {
			let realm = try Realm()
			let tweets = realm.objects(tweetModel.self).filter("userScreenName = '\(screenName)'")
				return Array(tweets)
		} catch {
			print(error.localizedDescription)
			return nil
		}
	}
	
	class func saveTweets(_ tweets: [tweetModel]) {
		for tweet in tweets {
			do {
				let realm = try Realm()
				try realm.write {
					realm.add(tweet, update: true)
				}
			} catch {
				print(error.localizedDescription)
			}
		}
	}
	
}
