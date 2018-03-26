//
//  RequestCenter.swift
//  sijieduProject
//
//  Created by qiong on 2018/1/19.
//  Copyright © 2018年 qiong. All rights reserved.
//
import Foundation
import Alamofire
import SwiftyJSON


struct goodsParticular:Request {
    
    var goodsID :String
    var path: String {
        return Api.goodsParticularsURL
    }
    var method: HTTPMethod = .post
    
    var parameter: [String : AnyObject] {
        return ["goods_id": goodsID as AnyObject]
    }
    
    typealias Analysis = ParticularsAnalysis
    
}

struct courseListRequest:Request {
    let dic :Dictionary<String, Any>
    var method: HTTPMethod = .post
    var path: String {
        return Api.courseListRequestUrl
    }
    var parameter: [String : AnyObject]{
        return dic as [String : AnyObject]
    }
    
    typealias Analysis  = ParticularsAnalysis
    
}


extension ParticularsAnalysis: Decodable {
    static func parse(anyData: Any) -> ParticularsAnalysis? {
        return ParticularsAnalysis(anyData: anyData)
    }
}
struct ParticularsAnalysis {
    
    var message: Bool
    var tempData: Any
    
    init?(anyData: Any) {
        
        let obj = JSON(anyData)
        
        guard let name = obj["ret"].int else {
            self.message = false
            return nil
        }
        
        if name == 2000 {
            self.message = true
            self.tempData = anyData
        } else {
            self.message = false
            self.tempData = anyData
            
        }
    }
}
