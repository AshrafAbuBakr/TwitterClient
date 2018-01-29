//
//  StickyHeaderView.swift
//  TwitterClient
//
//  Created by Ashraf Abu Bakr on 1/29/18.
//  Copyright © 2018 Eventtus. All rights reserved.
//

import UIKit
import Kingfisher

class StickyHeaderView: UIView {

	@IBOutlet weak var view: UIView!
	@IBOutlet weak var backgroundImageView: UIImageView!
	@IBOutlet weak var followerImageView: UIImageView!
	@IBOutlet weak var handleLabel: UILabel!
	@IBOutlet weak var backgroundImageViewBottomConstraint: NSLayoutConstraint!
	
	// MARK: - init
	override init(frame: CGRect) {
		super.init(frame: frame)
		view = Bundle.main.loadNibNamed("StickyHeaderView", owner: self, options: nil)?[0] as! UIView
		self.addSubview(view)
		view.frame = frame
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	override func awakeFromNib() {
		super.awakeFromNib()
		
	}
	
	
	func setupView(withFollower follower: FollowersModel) {
		var defaultColorImage = UIImage(color: UIColor.color(string: "1dcaff"))
		if let bgCode = follower.profile_background_color {
			defaultColorImage = UIImage(color: UIColor.color(string: bgCode))
			backgroundImageView.image = defaultColorImage
		}
		
		if let backgroundImageURL = follower.profile_background_image_url_https {
			if backgroundImageURL.length > 0 {
				let resource = ImageResource(downloadURL: URL(string: backgroundImageURL)!)
				backgroundImageView.kf.setImage(with: resource)
			}
		}
		
		if let followerImageURL = follower.profile_image_url_https {
			if followerImageURL.length > 0 {
				let followerResource = ImageResource(downloadURL: URL(string: followerImageURL)!)
				followerImageView.kf.setImage(with: followerResource)
			}
		}
		
		if follower.screen_name .length > 0 {
			handleLabel.text = "@\(follower.screen_name)"
		}
	}
	
	func updateView(withScrollviewOffset offsetY: CGFloat) {
		if offsetY < 0 {
			backgroundImageView.frame = CGRect(x: offsetY ,y: offsetY, width: self.bounds.width - (offsetY * 2) , height: self.bounds.height - 66 - offsetY);
		} else {
			backgroundImageView.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height - 66);
		}
	}
}
