//
//  CourseTestViewController.swift
//  sijieduProject
//
//  Created by qiong on 2017/12/29.
//  Copyright © 2017年 qiong. All rights reserved.
//
//测评活动
import UIKit

class CourseTestViewController: BaseViewController {

    lazy var contestTable: UITableView = {
    let view = UITableView.init(frame: CGRect.init(x: 0, y: kTopHeight, width: kScreenWidth, height: (kScreenHeight - kTopHeight -  kTabBarHeight)), style: UITableViewStyle.grouped)
        view.delegate = self
        view.dataSource = self
        view.separatorStyle = UITableViewCellSeparatorStyle.none
        view.register(ContestTableViewCell.self, forCellReuseIdentifier: "cell")
        view.rowHeight = 80
        view.estimatedSectionHeaderHeight = 0
        view.backgroundColor = UIColor.clear
        view.showsVerticalScrollIndicator = false
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="测评活动";
     self.view.addSubview(contestTable)
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
extension CourseTestViewController:UITableViewDelegate,UITableViewDataSource{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")as?ContestTableViewCell
        cell?.backgroundColor = UIColor.clear
        cell?.delegate = self
        if indexPath.row==0 {
            cell?.topLine.isHidden = true
        }else{
             cell?.topLine.isHidden = false
        }
        
        if indexPath.row==9 {
            cell?.bottomLine.isHidden = true
        }else{
            cell?.bottomLine.isHidden = false

        }
        cell?.finishBlock = {
            (back:String)->Void in
            print("=====",back)
        }
        return cell!
        
    }
    
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1;
    }
    
}

extension CourseTestViewController:GetMessageDelegate{
    public func getMessage(controller: ContestTableViewCell, string: String) {
        let test = TestViewController()
        self.hidesBottomBarWhenPushed = true;
        self.navigationController?.pushViewController(test, animated: true)
        self.hidesBottomBarWhenPushed = false;

        print(string);
    }
}
