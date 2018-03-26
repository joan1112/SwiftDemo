//
//  TestViewController.swift
//  sijieduProject
//
//  Created by qiong on 2018/1/26.
//  Copyright © 2018年 qiong. All rights reserved.
//

import UIKit

class TestViewController: BaseViewController {

    lazy var content: UITableView = {
        let view = UITableView.init(frame: CGRect.init(x: 0, y: kTopHeight, width: kScreenWidth, height: kScreenHeight - kTopHeight), style: UITableViewStyle.grouped)
        view.delegate = self
        view.dataSource = self
        view.rowHeight = 50
        self.view.addSubview(view)
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
      content.backgroundColor = UIColor.clear
    }

    override func viewWillAppear(_ animated: Bool) {
        //self.tabBarController?.tabBar.isHidden = true
        self.hideTabbar()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

extension TestViewController:UITableViewDelegate,UITableViewDataSource{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 16
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if !(cell != nil) {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
            let  tf = UITextField.init(frame: CGRect.init(x: 30, y: 10, width: 100, height: 40))
            cell?.addSubview(tf)
            tf.placeholder = "请输入文字"
            tf.tag=11;
        }
        
        return cell!
    }
}
