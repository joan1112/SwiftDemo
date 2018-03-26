//
//  Api.swift
//  sijieduProject
//
//  Created by qiong on 2018/1/19.
//  Copyright © 2018年 qiong. All rights reserved.
//

import UIKit

struct Api {
    static let host = "http://student.sijiedu.com/includes/sijiapp_test/"
    
    static func map(path: String) -> String {
        return host + path
    }
    
    static var goodsParticularsURL: String {
        return map(path: "goods/getgoods")
    }
    ///  .... 接着继续其他接口的书写
    
    static var courseListRequestUrl:String{
        return map(path: "classRegisterStu_searc")
    }
}
