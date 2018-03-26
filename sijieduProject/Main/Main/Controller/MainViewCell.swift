//
//  MainViewCell.swift
//  sijieduProject
//
//  Created by qiong on 2017/12/29.
//  Copyright © 2017年 qiong. All rights reserved.
//

import UIKit

class MainViewCell: UICollectionViewCell {
    let bgview:UIView = UIView()
    let iconImage:UIImageView = UIImageView()
    let titleLab:UILabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        bgview.backgroundColor = UIColor.white
        self.addSubview(bgview)
        bgview.layer.cornerRadius = 5
        bgview.layer.masksToBounds = true
        self.titleLab.textAlignment = NSTextAlignment.center;
        bgview.addSubview(self.iconImage)
        bgview.addSubview(self.titleLab)
        
        bgview.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        iconImage.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(15)
            make.width.height.equalTo(self.zc_width/3)
        }
        
        titleLab.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(bgview.snp.bottom).offset(-15)
            make.width.equalTo(160);
            make.height.equalTo(25)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
