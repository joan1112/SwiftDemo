//
//  CourseTableViewCell.swift
//  sijieduProject
//
//  Created by qiong on 2018/1/19.
//  Copyright © 2018年 qiong. All rights reserved.
//

import UIKit

class CourseTableViewCell: UITableViewCell {

    let leftImage = UIImageView()
    let nameLab = UILabel()
    let tip:CustomeTip = CustomeTip()
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(leftImage)
        self.contentView.addSubview(nameLab)
        self.contentView.addSubview(tip)
        
        leftImage.image = UIImage.init(named: "chinese")
        
        nameLab.numberOfLines = 2
        nameLab.font = MainFont
        nameLab.textColor = mainColor
        
        nameLab.text = "精英班三年级夏季"
        
        leftImage.snp.makeConstraints { (make) in
        make.left.top.bottom.equalToSuperview()
       make.width.equalTo(leftImage.snp.height)
        }
        
        nameLab.snp.makeConstraints { (make) in
            make.left.equalTo(leftImage.snp.right).offset(10)
            make.top.equalTo(self.contentView.snp.top).offset(10)
        }
        
        
    }
    
    func setupUI(){
        
    }
    override func layoutSubviews() {
        tip.frame = CGRect.init(x: self.zc_height, y: (self.zc_height - 30), width: 160, height: 5)
        
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
