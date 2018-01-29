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
	}

}
