//
//  TweetTableViewCell.swift
//  TwitterClient
//
//  Created by Ashraf Abu Bakr on 1/29/18.
//  Copyright © 2018 Eventtus. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {

	@IBOutlet weak var tweetTextLabel: UILabel!
	@IBOutlet weak var dateLabel: UILabel!
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	func setupCell(withTweet tweet: tweetModel) {
		tweetTextLabel.text = tweet.text
		//Thu Apr 06 15:28:43 +0000 2017
		if let tweetDate = tweet.created_at {
			let formatter = DateFormatter()
			formatter.dateFormat = "EEE MMM dd HH:mm:ss ZZ YYYY"
			if let date = formatter.date(from: tweetDate) {
				formatter.dateFormat = "dd MMM YYYY"
				let formattedDate = formatter.string(from: date)
				dateLabel.text = formattedDate
			}
		}
	}

}
