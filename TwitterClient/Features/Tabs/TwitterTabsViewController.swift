//
//  TwitterTabsViewController.swift
//  TwitterClient
//
//  Created by Ashraf Abu Bakr on 1/25/18.
//  Copyright © 2018 Eventtus. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TwitterTabsViewController: TwitterPagerTabStripViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		navigationController?.isNavigationBarHidden = false
		navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
		
		let child_1 = storyboard?.instantiateViewController(withIdentifier: "followersListVC")
		//		let child_2 = ChildExampleViewController(itemInfo: "View")
		//		let child_3 = TableChildExampleViewController(style: .grouped, itemInfo: "TableView 2")
		//		let child_4 = ChildExampleViewController(itemInfo: "View 2")
		//		let child_5 = TableChildExampleViewController(style: .plain, itemInfo: "TableView 3")
		//		let child_6 = ChildExampleViewController(itemInfo: "View 3")
		//		let child_7 = TableChildExampleViewController(style: .grouped, itemInfo: "TableView 4")
		//		let child_8 = ChildExampleViewController(itemInfo: "View 4")
		//
		//		guard isReload else {
		//			return [child_1, child_2, child_3, child_4, child_5, child_6, child_7, child_8]
		//		}
		//
		let childViewControllers: [UIViewController] = [child_1!]
		//
		//		for index in childViewControllers.indices {
		//			let nElements = childViewControllers.count - index
		//			let n = (Int(arc4random()) % nElements) + index
		//			if n != index {
		//				childViewControllers.swapAt(index, n)
		//			}
		//		}
		//		let nItems = 1 + (arc4random() % 8)
		return childViewControllers
	}
}

//MARK: - Tabs handling.
extension TwitterTabsViewController {
	
}
