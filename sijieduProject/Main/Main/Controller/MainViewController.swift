//
//  MainViewController.swift
//  sijieduProject
//
//  Created by qiong on 2017/12/29.
//  Copyright © 2017年 qiong. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {
    var titles = ["查询报班","测评活动","预约试听","测评培训班"];
    var images = ["report_class","test_report","ahead_listen","train_class"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view1 = UIView.init();
        view1.frame = CGRect.zero;
        self.view.addSubview(view1);
        self.title="网上校区";
        let layout = UICollectionViewFlowLayout.init()
        //列间距,行间距,偏移
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 15
        layout.itemSize = CGSize.init(width: (kScreenWidth-35)/2, height: (((kScreenWidth-35)/2)*3)/4)
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
        layout.headerReferenceSize = CGSize.init(width: kScreenWidth, height: kScreenWidth/1.79)
        let collect = UICollectionView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight-44), collectionViewLayout: layout);
        view1.addSubview(collect)
        collect.delegate = self
        collect.dataSource = self
        collect.backgroundColor = UIColor.clear;
        if #available(iOS 11.0, *) {
            collect.contentInsetAdjustmentBehavior = .never;
        }
       

        collect.register(MainViewCell.self, forCellWithReuseIdentifier: "cell")
        collect.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "head")
    }
   
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
extension MainViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return titles.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)as!MainViewCell
        cell.iconImage.image = UIImage.init(named: images[indexPath.item])
        cell.titleLab.text=titles[indexPath.item]
        return cell;
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
 
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView{
        if kind == UICollectionElementKindSectionHeader {
            let header = collectionView .dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "head", for: indexPath)
            
            let head = UIView.init();
            head.frame = CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenWidth/1.79)
            header.addSubview(head)
            let imgView = UIImageView()
            imgView.frame = head.frame
            head.addSubview(imgView)
            imgView.image = UIImage.init(named: "head_bg")
            
            let lab = UILabel.init()
            lab.center = CGPoint.init(x: kScreenWidth/2, y: kStatusBarHeight+20)
            lab.bounds = CGRect.init(x: 0, y: 0, width: 100, height: 30)
            lab.textAlignment = NSTextAlignment.center
            lab.text = "网上校区"
            lab.textColor = UIColor.white
            lab.font = ThemeFont
            imgView.addSubview(lab)
            
            return header
        }
        return UICollectionReusableView();
    }
}
