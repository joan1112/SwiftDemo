//
//  ContestTableViewCell.swift
//  sijieduProject
//
//  Created by qiong on 2018/1/23.
//  Copyright © 2018年 qiong. All rights reserved.
//

import UIKit
typealias getClickStrBlock = (String)->Void
class ContestTableViewCell: UITableViewCell {

    var delegate:GetMessageDelegate?//代理
    var finishBlock: getClickStrBlock?//闭包传值
    
   
    
    let leftBg = UIView()//白色背景
    let timeLab = UILabel()
    let topLine = UILabel()
    let bottomLine = UILabel()
    
    let rightBg = UIView()
    let itemArr = ["可视角度","李易峰","叫阿好看","阿娇换手机啊","到头来一场空","叫阿就会看电视吧","阿胶糕心啊"]
    
    
    lazy var itemCollect: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 15
        layout.sectionInset = UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: 10)
        let view = UICollectionView.init(frame: CGRect.init(x: kScreenWidth/3.5, y: 0, width: (kScreenWidth  - kScreenWidth/3.5), height: 80), collectionViewLayout: layout)
        view.delegate = self;
        view.backgroundColor = UIColor.clear
        view.dataSource = self;
        view.showsHorizontalScrollIndicator = false
        self.contentView.addSubview(view)
        return view
    }()
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier   )
        initUI()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
   fileprivate  func initUI()  {
    self.contentView.addSubview(leftBg)
    timeLab.text = "2017-02"
    timeLab.textColor = UIColor.init(hexString: "f5c70f")
    timeLab.font = NextFont
    leftBg.addSubview(timeLab)
    timeLab.textAlignment = NSTextAlignment.center
    
    leftBg.backgroundColor = UIColor.white
    
    leftBg.snp.makeConstraints { (make) in
        make.left.top.bottom.equalTo(self.contentView)
       make.width.equalTo(kScreenWidth/3.5)
    }
    
    timeLab.snp.makeConstraints { (make) in
        make.center.equalTo(leftBg.snp.center)
        make.width.equalTo(leftBg.snp.width)
        make.height.equalTo(30)
    }
    
    topLine.backgroundColor = UIColor.init(hexString: "f5c70f")
    bottomLine.backgroundColor = UIColor.init(hexString: "f5c70f")
    leftBg.addSubview(topLine)
    leftBg.addSubview(bottomLine)
    
    topLine.snp.makeConstraints { (make) in
        make.top.equalTo(leftBg.snp.top);
        make.bottom.equalTo(timeLab.snp.top);
        make.width.equalTo(1)
        make.centerX.equalTo(leftBg.snp.centerX)
    }
    bottomLine.snp.makeConstraints { (make) in
        make.top.equalTo(timeLab.snp.bottom);
        make.bottom.equalTo(leftBg.snp.bottom);
        make.width.equalTo(1)
        make.centerX.equalTo(leftBg.snp.centerX)

    }
    
    itemCollect.register(ContestItemCell.self, forCellWithReuseIdentifier: "itemCell")
   
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension ContestTableViewCell:UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource{
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemArr.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath)as?ContestItemCell
        cell?.itemLabs.text = itemArr[indexPath.item]
        return cell!
        
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let initSize = CGSize.init(width: 1000, height:50);

        let dic = NSDictionary(object: UIFont.systemFont(ofSize: 13), forKey: NSAttributedStringKey.font as NSCopying)
        let size : CGSize = itemArr[indexPath.item].boundingRect(with: initSize, options: .usesLineFragmentOrigin, attributes: dic as? [NSAttributedStringKey : Any], context: nil).size
        var width11 = (size.width+15)/2
        if width11<60 {
            width11 = 60
        }
        
        return CGSize.init(width: width11, height: 50)
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let strs = itemArr[indexPath.item]
        delegate?.getMessage(controller: self, string: strs)
        if self.finishBlock != nil {
            self.finishBlock!(strs)
        }
    }
    
    
    
    
}

//代理
protocol GetMessageDelegate:NSObjectProtocol {
    func getMessage(controller:ContestTableViewCell,string:String)
}
















