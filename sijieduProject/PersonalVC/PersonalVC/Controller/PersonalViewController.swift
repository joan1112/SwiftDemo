//
//  PersonalViewController.swift
//  sijieduProject
//
//  Created by qiong on 2017/12/29.
//  Copyright © 2017年 qiong. All rights reserved.
//

import UIKit
fileprivate let cellReuse = "personCell"
class PersonalViewController: BaseViewController {
    
    
    let titleArr = ["我的订单","学员信息","我的预约","联系客服","系统设置"]
    let imageArr = ["icon-dingdan","icon-information","icon-audition","icon-service","icon-Set-up"]

    
    
    
    lazy var personTab: UITableView = {
       let table = UITableView.init(frame: CGRect.init(x: 0, y: kNavBarHeight, width: kScreenWidth, height: kScreenHeight - kNavBarHeight - kTabBarHeight), style: UITableViewStyle.grouped)
        table.delegate = self
        table.dataSource = self
        table.rowHeight = 50
        table.estimatedSectionFooterHeight = 0
        table.estimatedSectionHeaderHeight = 0
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       self.title = "个人中心"
        self.view.addSubview(personTab)
        setUpUI()
        
    
    }

    fileprivate func setUpUI(){
        let headView = UIView()
        headView.frame = CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight/3.5)
        headView.backgroundColor = ThemeColor
        personTab.tableHeaderView = headView
    
        let headbtn = UIButton.init(type: UIButtonType.custom)
        headbtn.setImage(UIImage.init(named: "headBg"), for: UIControlState.normal)
        headbtn.center = headView.zc_center
        headbtn.bounds = CGRect.init(x: 0, y: 0, width: 70, height: 70)
        headbtn.layer.cornerRadius = 35
        headbtn.layer.masksToBounds = true
        headbtn.imageView?.contentMode = .scaleToFill
        headView.addSubview(headbtn)
        
        let nameLab = UILabel()
        nameLab.center = CGPoint.init(x: kScreenWidth/2, y: headView.zc_centerY+50)
        nameLab.bounds = CGRect.init(x: 0, y: 0, width: 100, height: 25)
        nameLab.textColor = UIColor.white
        nameLab.font = UIFont.systemFont(ofSize: 13)
        nameLab.textAlignment = NSTextAlignment.center
        
    
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    
    
    }
    


}
// MARK: - dataSource
extension PersonalViewController:UITableViewDelegate,UITableViewDataSource{
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {return 3}
        return 2
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellReuse)
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: cellReuse)
        }
        if indexPath.section == 0 {
            cell?.imageView?.image = UIImage.init(named: imageArr[indexPath.row])
           cell?.textLabel?.text = titleArr[indexPath.row]
        }else{
            cell?.imageView?.image = UIImage.init(named: imageArr[indexPath.row+3])
            cell?.textLabel?.text = titleArr[indexPath.row+3]
        }
        return cell!
        
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
   
}
