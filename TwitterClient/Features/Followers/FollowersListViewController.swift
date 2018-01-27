//
//  FollowersListViewController.swift
//  TwitterClient
//
//  Created by Ashraf Abu Bakr on 1/25/18.
//  Copyright © 2018 Eventtus. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import RealmSwift

class FollowersListViewController: UIViewController {

	@IBOutlet weak var followersTableView: UITableView!
	var presenter: FollowersListPresenter?
	var followers: List<FollowersModel>?
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		presenter = FollowersListPresenter(withView: self)
		presenter?.getFollowersList()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func setupFollowersTable(withFollowers followers: List<FollowersModel>) {
		self.followers = followers
		followersTableView.estimatedRowHeight = 106
		followersTableView.rowHeight = UITableViewAutomaticDimension
		followersTableView.reloadData()
	}
}

//MARK: - Tableview Delegate
extension FollowersListViewController: UITableViewDataSource, UITableViewDelegate {
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return followers?.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "FollowerCell", for: indexPath) as! FollowerTableViewCell
		cell.setupCell(withFollower: followers![indexPath.row])
		if indexPath.row == (followers?.count)! - 1 {
			cell.separatorView.isHidden = true
		} else {
			cell.separatorView.isHidden = false
		}
		return cell
	}
}

//MARK: - Tabs handling
extension FollowersListViewController: IndicatorInfoProvider {
	func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
		let itemInfo = IndicatorInfo(title: "Followers")
		return itemInfo
	}
}
