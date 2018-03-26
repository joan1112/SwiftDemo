//
//  CustomeTip.swift
//  sijieduProject
//
//  Created by qiong on 2018/1/23.
//  Copyright © 2018年 qiong. All rights reserved.
//

import UIKit

class CustomeTip: UIView {

    let oneLab = UILabel()
    let secondLab = UILabel()
    let thirdLab = UILabel()
    let fourthLab = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
  fileprivate  func initUI()  {
    self.layer.borderColor = UIColor.init(hexString: "cccccc").cgColor
    self.layer.borderWidth = 1
    self.zc_width = 160
    self.zc_height = 5
    oneLab.frame = CGRect.init(x: 0, y: 0, width: self.zc_width/4 - 0.5, height: self.zc_height)
    oneLab.backgroundColor = UIColor.init(hexString: "e5e5e5")
    self.addSubview(oneLab)
    
    secondLab.frame = CGRect.init(x: self.zc_width/4 + 0.5, y: 0, width: self.zc_width/4 - 1, height: self.zc_height)
    secondLab.backgroundColor = UIColor.init(hexString: "e5e5e5")
    self.addSubview(secondLab)
    
    thirdLab.frame = CGRect.init(x: self.zc_width/2 + 0.5, y: 0, width: self.zc_width/4 - 1, height: self.zc_height)
    thirdLab.backgroundColor = UIColor.init(hexString: "e5e5e5")
    self.addSubview(thirdLab)
    
    fourthLab.frame = CGRect.init(x:(self.zc_width/4)*3 , y: 0, width: self.zc_width/4 - 0.5, height: self.zc_height)
    fourthLab.backgroundColor = UIColor.init(hexString: "e5e5e5")
    self.addSubview(fourthLab)
    
    let lineLab = UILabel()
    lineLab.frame = CGRect.init(x: self.zc_width/4 - 0.5, y: 0, width: 1, height: self.zc_height)
    self.addSubview(lineLab)
    
    let lineLab1 = UILabel()
    lineLab1.frame = CGRect.init(x: self.zc_width/2 - 0.5, y: 0, width: 1, height: self.zc_height)
    self.addSubview(lineLab1)
    
    let lineLab2 = UILabel()
    lineLab2.frame = CGRect.init(x: (self.zc_width/4)*3 - 0.5, y: 0, width: 1, height: self.zc_height)
    self.addSubview(lineLab2)
    
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
