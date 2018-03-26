//
//  BaseViewController.swift
//  sijieduProject
//
//  Created by qiong on 2017/12/25.
//  Copyright © 2017年 qiong. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(hexString: "F5F5F5");
        // Do any additional setup after loading the view.
        self.automaticallyAdjustsScrollViewInsets = false;
        
        self.edgesForExtendedLayout = UIRectEdge.init(rawValue: 5);
        
       cheackNetwork()
      

    }
 fileprivate  func cheackNetwork()  {
        
        
        let manager = NetworkReachabilityManager(host: "www.baidu.com")
        manager?.listener = {status in
            switch status {
            case .notReachable:do {
                print("no...")
                }
            case .unknown:do {
                print("unknow...")
                
                }
            case .reachable(.ethernetOrWiFi):do {
                print("ywsss...")
                
                }
            case .reachable(.wwan):do {
                print("ywsswan o...")
                
                }
                
            }
           
        }
         manager?.startListening()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       // self.tabBarController?.tabBar.isHidden = false
          self.showTabbar()
        UIApplication.shared.statusBarStyle = .lightContent
       // self.extendedLayoutIncludesOpaqueBars = false
       // self.navigationController?.navigationBar.isTranslucent = false
       // self .setStatusBarBackgroundColor(color: UIColor.init(hexString: "198de6"))
    }
    func setStatusBarBackgroundColor(color : UIColor) {
        let statusBarWindow : UIView = UIApplication.shared.value(forKey: "statusBarWindow") as! UIView
        let statusBar : UIView = statusBarWindow.value(forKey: "statusBar") as! UIView
        
        if statusBar.responds(to:#selector(setter: UIView.backgroundColor)) {
         statusBar.backgroundColor = color
         }
    }
    
    func hideTabbar(){
        if self.tabBarController?.tabBar.isHidden == true {
            return;
        }
        var contentView:UIView;
        if (self.tabBarController?.view.subviews[0].isKind(of: UITabBar.self) == true) {
            contentView = (self.tabBarController?.view.subviews[1])!;
        }else{
            contentView = (self.tabBarController?.view.subviews[0])!;
            contentView.frame = CGRect.init(x: contentView.zc_x, y: contentView.zc_y, width: contentView.zc_width, height: contentView.zc_height + (self.tabBarController?.tabBar.zc_height)!);
            
            self.tabBarController?.tabBar.isHidden = true;
            
            
          
        }
        
        
    }
    
    func showTabbar() {
        if self.tabBarController?.tabBar.isHidden == false {
            return;
        }
        var contentView:UIView;
        if (self.tabBarController?.view.subviews[0].isKind(of: UITabBar.self) == true) {
            contentView = (self.tabBarController?.view.subviews[1])!;
        }else{
            contentView = (self.tabBarController?.view.subviews[0])!;
            contentView.frame = CGRect.init(x: contentView.zc_x, y: contentView.zc_y, width: contentView.zc_width, height: contentView.zc_height - (self.tabBarController?.tabBar.zc_height)!);
            
            self.tabBarController?.tabBar.isHidden = true;
            
            
            
        }
    }
}

