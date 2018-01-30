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
	
	var backgroundTapGestureRecognizer: UITapGestureRecognizer?
	var followerImageTapGestureRecognizer: UITapGestureRecognizer?
	
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
	

	/// Uses data from a follower object to fill the data in the view.
	///
	/// - Parameter follower: the follower of whom the details are showing.
	func setupView(withFollower follower: FollowersModel) {
		
		backgroundTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(backgroundImageTapped))
		followerImageTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(followerImageTapped))
		
		var defaultColorImage = UIImage(color: UIColor.color(string: "1dcaff"))
		if let bgCode = follower.profile_background_color {
			defaultColorImage = UIImage(color: UIColor.color(string: bgCode))
			backgroundImageView.image = defaultColorImage
		}
		
		if let backgroundImageURL = follower.profile_background_image_url_https {
			if backgroundImageURL.length > 0 {
				let resource = ImageResource(downloadURL: URL(string: backgroundImageURL)!)
				backgroundImageView.kf.setImage(with: resource)
				backgroundImageView.addGestureRecognizer(backgroundTapGestureRecognizer!)
			}
		}
		
		if let followerImageURL = follower.profile_image_url_https {
			if followerImageURL.length > 0 {
				let followerResource = ImageResource(downloadURL: URL(string: followerImageURL)!)
				followerImageView.kf.setImage(with: followerResource)
				followerImageView.addGestureRecognizer(followerImageTapGestureRecognizer!)
			}
		}
		
		
		if follower.screen_name .length > 0 {
			handleLabel.text = "@\(follower.screen_name)"
		}
	}
	
	
	
	/// Shows the background image in an overlay when tapped
	@objc private func backgroundImageTapped() {
		let canceltapGesture = UITapGestureRecognizer(target: self, action: #selector(removeImage))
		let containerView = UIView(frame: UIScreen.main.bounds, backgroundColor: UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.6))
		containerView.tag = -999
		containerView.alpha = 0.0
		containerView.addGestureRecognizer(canceltapGesture)
		UIApplication.shared.keyWindow?.addSubview(containerView)
		let imageView = UIImageView(frame: backgroundImageView.bounds)
		imageView.image = backgroundImageView.image
		self.addSubview(imageView)
		
		UIView.animate(withDuration: 0.3, animations: {
			imageView.center = containerView.convert(containerView.center, to: self)
		}) { (completed) in
			containerView.alpha = 1.0
			containerView.addSubview(imageView)
			imageView.center = containerView.center
		}
	}
	
	/// Shows the follower image in an overlay when tapped
	@objc private func followerImageTapped() {
		let canceltapGesture = UITapGestureRecognizer(target: self, action: #selector(removeImage))
		let containerView = UIView(frame: UIScreen.main.bounds, backgroundColor: UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.6))
		containerView.tag = -999
		containerView.alpha = 0.0
		containerView.addGestureRecognizer(canceltapGesture)
		UIApplication.shared.keyWindow?.addSubview(containerView)
		let imageView = UIImageView(frame: followerImageView.frame)
		imageView.image = followerImageView.image
		self.addSubview(imageView)
		
		UIView.animate(withDuration: 0.3, animations: {
			imageView.transform = imageView.transform.scaledBy(x: 2, y: 2)
			imageView.center = containerView.convert(containerView.center, to: self)
		}) { (completed) in
			containerView.alpha = 1.0
			containerView.addSubview(imageView)
			imageView.center = containerView.center
		}
		
	}
	
	/// Removes the currently showing image overlay.
	@objc private func removeImage() {
		if let container = UIApplication.shared.keyWindow?.viewWithTag(-999) {
			UIView.animate(withDuration: 0.3, animations: {
				container.alpha = 0.0
			}, completion: { (completed) in
				container.removeFromSuperview()
			})
			
		}
		
	}
	
	
	/// Updates the background image based on the scrolling offset to create a stretching effect.
	///
	/// - Parameter offsetY: current scrollview offset.
	func updateView(withScrollviewOffset offsetY: CGFloat) {
		if offsetY < 0 {
			backgroundImageView.frame = CGRect(x: offsetY ,y: offsetY, width: self.bounds.width - (offsetY * 2) , height: self.bounds.height - 66 - offsetY);
		} else {
			backgroundImageView.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height - 66);
		}
	}
}
