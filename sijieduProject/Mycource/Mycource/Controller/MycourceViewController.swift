//
//  MycourceViewController.swift
//  sijieduProject
//
//  Created by qiong on 2017/12/29.
//  Copyright © 2017年 qiong. All rights reserved.
//

import UIKit
import Alamofire
class MycourceViewController: BaseViewController {
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.title="我的课程";
 
        let courseTab:UITableView = UITableView.init(frame: CGRect.init(x: 0, y:kTopHeight , width: kScreenWidth, height: kScreenHeight-kTopHeight - kTabBarHeight), style: UITableViewStyle.grouped)
        courseTab.delegate = self;
        courseTab.dataSource = self;
        courseTab.rowHeight = 100;
        
        self.view.addSubview(courseTab)
        courseTab.register(CourseTableViewCell.self, forCellReuseIdentifier: "cell")
        if #available(iOS 11.0, *) {
//            contentView.contentInsetAdjustmentBehavior = .never
            courseTab.estimatedSectionFooterHeight = 0
            courseTab.estimatedSectionHeaderHeight = 0
        }else{
            
            automaticallyAdjustsScrollViewInsets = false
        }
        
        let dic = ["ifcontest":"false"]
        guard let data = try? JSONSerialization.data(withJSONObject: dic, options: .init(rawValue: 0)) else { return }
        let jsonstr = String(data: data, encoding: .utf8)
 
        var paramer = [String: Any]()
        paramer["json"] = jsonstr
        paramer["type"] = "complete"
     
        MYMBProgress.JL_ShowViewAfterSecond(title: "loading..", view: self.view, afterSecond: 2)
        
        RequestTool.init().RequestDataWith(url: "classRegisterStu_search", parameter: paramer) { (success,data) in
            print(success,data)
        }
        
    }

    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
    
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

extension MycourceViewController:UITableViewDelegate,UITableViewDataSource{
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")as?CourseTableViewCell
      cell?.selectionStyle = UITableViewCellSelectionStyle.none
        return cell!
        
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1;
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let test = TestViewController()
        self.navigationController?.pushViewController(test, animated: true)
        
    }
    
}
