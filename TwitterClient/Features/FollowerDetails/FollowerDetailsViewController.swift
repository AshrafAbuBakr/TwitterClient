//
//  FollowerDetailsViewController.swift
//  TwitterClient
//
//  Created by Ashraf Abu Bakr on 1/28/18.1dcaff
//  Copyright © 2018 Eventtus. All rights reserved.
//

import UIKit
import Kingfisher
import TwitterKit
import BFKit

class FollowerDetailsViewController: UIViewController {

	@IBOutlet weak var tweetsTableView: UITableView!
	var defaultColorImage: UIImage?
	var follower: FollowersModel?
	var presenter: FollowerDetailsPresenter?
	var tweets: [tweetModel]?
	var stretchingHeader: StickyHeaderView?
	
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		presenter = FollowerDetailsPresenter(withView: self)
		setup(withFollower: follower!)
    }
	
	override func viewDidAppear(_ animated: Bool) {
		guard follower != nil else {
			return
		}
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func setup(withFollower follower: FollowersModel) {
		
		navigationItem.title = follower.name
	
		stretchingHeader = StickyHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 300))
		stretchingHeader?.setupView(withFollower: follower)
		tweetsTableView.tableHeaderView = stretchingHeader
		presenter?.getFollowerTweets(forScreenName: follower.screen_name)
	}
	
	@objc func backAction(){
		navigationController?.popViewController(animated: true)
	}
	
	func setupTweetsTableView(withTweets tweetsList: [tweetModel]) {
		tweets = tweetsList
		tweetsTableView.estimatedRowHeight = 80
		tweetsTableView.rowHeight = UITableViewAutomaticDimension
		tweetsTableView.reloadData()
	}
}

extension FollowerDetailsViewController: UITableViewDelegate, UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return tweets?.count ?? 0
	}
	
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "tweetCell", for: indexPath) as! TweetTableViewCell
		cell.setupCell(withTweet: tweets![indexPath.row])
//		if indexPath.row == (followers?.count)! - 1 {
//			cell.separatorView.isHidden = true
//		} else {
//			cell.separatorView.isHidden = false
//		}
		return cell
	}
	
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		
		let offsetY = scrollView.contentOffset.y
		stretchingHeader?.updateView(withScrollviewOffset: offsetY)
	}
	
//	- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//	{
//	CGFloat offsetY = scrollView.contentOffset.y;
//	UIView *headerContentView = self.tableView.tableHeaderView.subviews[0];
//	headerContentView.transform = CGAffineTransformMakeTranslation(0, MIN(offsetY, 0));
//	}
	
}
