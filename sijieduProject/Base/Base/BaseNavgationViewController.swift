//
//  BaseNavgationViewController.swift
//  sijieduProject
//
//  Created by qiong on 2017/12/25.
//  Copyright © 2017年 qiong. All rights reserved.
//

import UIKit

class BaseNavgationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
 //设置导航条颜色
        self.navigationBar.barTintColor = UIColor.init(hexString: "198de6")
        
        self.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.init(hexString: "FFFFFF"),NSAttributedStringKey.font:UIFont.systemFont(ofSize: 18)]
        
        // Do any additional setup after loading the view.
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        self .setNavigationBarHidden(false, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
