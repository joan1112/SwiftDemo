//
//  MainTabbarViewController.swift
//  sijieduProject
//
//  Created by qiong on 2017/12/29.
//  Copyright © 2017年 qiong. All rights reserved.
//

import UIKit

class MainTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let tabBar = UITabBarItem.appearance()
        let attrs_Normal = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12), NSAttributedStringKey.foregroundColor: UIColor.gray]
        let attrs_Select = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12), NSAttributedStringKey.foregroundColor: UIColor.darkGray]
        tabBar.setTitleTextAttributes(attrs_Normal, for: .normal)
        tabBar.setTitleTextAttributes(attrs_Select, for: .selected)
         setupUI()
        
    }
}
extension MainTabbarViewController{
    fileprivate func setupUI(){
    let vcArr:[UIViewController] = [MainViewController(),MycourceViewController(),CourseTestViewController(),PersonalViewController()]
    
        let titleArray = [("网上校区","icon_school"),("我的课程","icon_course"),("测评活动","icon_contest"),("个人中心","icon_my")];
        for (index, vc) in vcArr.enumerated() {
            vc.tabBarItem.title = titleArray[index].0
            vc.tabBarItem.image = UIImage(named: (titleArray[index].1))
            vc.tabBarItem.selectedImage = UIImage(named: "\(titleArray[index].1)1")
            let nav = BaseNavgationViewController(rootViewController: vc)
            addChildViewController(nav)
        }
        
    }
}
