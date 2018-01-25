//
//  FollowersListViewController.swift
//  TwitterClient
//
//  Created by Ashraf Abu Bakr on 1/25/18.
//  Copyright © 2018 Eventtus. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class FollowersListViewController: UIViewController {

	var presenter: FollowersListPresenter?
	
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
	
}

//MARK: - Tabs handling
extension FollowersListViewController: IndicatorInfoProvider {
	func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
		let itemInfo = IndicatorInfo(title: "Followers")
		return itemInfo
	}
}
