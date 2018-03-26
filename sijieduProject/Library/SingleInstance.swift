//
//  SingleInstance.swift
//  sijieduProject
//
//  Created by qiong on 2018/1/23.
//  Copyright © 2018年 qiong. All rights reserved.
//

import UIKit

class SingleInstance: NSObject {

    private static let single = SingleInstance()
    var datas = [String]()
    var userID = ""
    var userName = ""
    var telephone = ""
    
    
    
    
    private override init() {
        userID = UserDefaults.standard.object(forKey: "userID") as? String ?? ""
        userName = UserDefaults.standard.object(forKey: "userName")as? String ?? ""
        telephone = UserDefaults.standard.object(forKey: "tele")as? String ?? ""
    }
    class func defaultSingleInstance() ->SingleInstance{
        return single
    }
    
    public func setUserModelWithDic(dic:Dictionary<String, Any>){
        userID = dic["userID"] as? String ?? ""
        userName = dic["userName"] as? String ?? ""
        telephone = dic["tele"] as? String ?? ""
        UserDefaults.standard.set(userID, forKey: "userID")
        UserDefaults.standard.set(userName, forKey: "userName")
        UserDefaults.standard.set(telephone, forKey: "tele")

    }
    
    
}
