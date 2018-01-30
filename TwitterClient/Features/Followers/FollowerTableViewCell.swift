//
//  FollowerTableViewCell.swift
//  TwitterClient
//
//  Created by Ashraf Abu Bakr on 1/25/18.
//  Copyright © 2018 Eventtus. All rights reserved.
//

import UIKit
import Kingfisher
import BFKit


class FollowerTableViewCell: UITableViewCell {
	@IBOutlet weak var followerImageView: UIImageView!
	@IBOutlet weak var followerNameLabel: UILabel!
	@IBOutlet weak var followerHandleLabel: UILabel!
	@IBOutlet weak var followerBioLabel: UILabel!
	@IBOutlet weak var separatorView: UIView!
	var follower: FollowersModel?
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	func setupCell(withFollower follower: FollowersModel) {
		if follower.profile_image_url_https != nil && follower.profile_image_url_https!.length > 0 {
			if let url = URL(string: follower.profile_image_url_https!) {
				let resource = ImageResource(downloadURL: url)
				followerImageView.kf.setImage(with: resource)
			}
		}
		
		followerNameLabel.text = follower.name
		followerHandleLabel.text = "@\(follower.screen_name)"
		followerBioLabel.text = follower.bio
		self.follower = follower
	}

}
