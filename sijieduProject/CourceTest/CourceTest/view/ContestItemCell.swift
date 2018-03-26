//
//  ContestItemCell.swift
//  sijieduProject
//
//  Created by qiong on 2018/1/23.
//  Copyright © 2018年 qiong. All rights reserved.
//

import UIKit

class ContestItemCell: UICollectionViewCell {
    
    let itemLabs = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    fileprivate func initUI(){
      
        self.contentView.addSubview(itemLabs)
        itemLabs.numberOfLines = 2
        itemLabs.layer.borderWidth=1
        itemLabs.layer.borderColor = UIColor.init(hexString: "f5c70f").cgColor
        itemLabs.backgroundColor = UIColor.white
        itemLabs.textColor = UIColor.init(hexString: "333333")
        itemLabs.textAlignment = NSTextAlignment.center
        itemLabs.font = NextFont
        itemLabs.snp.makeConstraints { (make) in
            make.edges.equalTo(self.contentView)
        }
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
}
