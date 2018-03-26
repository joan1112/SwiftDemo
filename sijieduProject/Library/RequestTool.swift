//
//  RequestTool.swift
//  sijieduProject
//
//  Created by qiong on 2018/1/19.
//  Copyright © 2018年 qiong. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

fileprivate let host = "http://api.budejie.com/api/api_open.php"

class RequestTool: NSObject {
    
    
    func RequestDataWith(url:String,parameter:Dictionary<String, Any>,finishBlock:@escaping((success:Bool,data:Dictionary<String, Any>))->())  {
      
        let url12 = URL.init(string: host+url)
        Alamofire.request(url12!, method: .get, parameters: parameter).responseJSON { (response) in
            switch response.result{
                
            case let .success(value):
                guard let dict = value as?[String:Any] else{
                    return
                }
                finishBlock((true,dict))
                
            case let .failure(error):
                
                finishBlock((false,["error":error]))
            }
        }
        
    }
    
    
}


protocol Request {
    var path:String { get }
    var method:HTTPMethod { get }
    var parameter: [String:AnyObject]{ get}
    associatedtype Analysis :Decodable
    
    
}
protocol Decodable {
    static func parse(anyData: Any) -> Self?
}

protocol SenderRequest {
    func send<T: Request>(_ p: T, analysis: @escaping (T.Analysis?) -> Void)
}

struct SessionRequestSender: SenderRequest {
    func send<T : Request>(_ p: T, analysis: @escaping (T.Analysis?) -> Void) {
        Alamofire.request(p.path, method: p.method, parameters: p.parameter).responseJSON { (response) in
            switch response.result {
            case .success:
                if let anyData = response.result.value, let res = T.Analysis.parse(anyData: anyData) {
                    DispatchQueue.main.async {
                        analysis(res)
                    }
                }
            case .failure(_):
                break
            }
        }
    }
}
