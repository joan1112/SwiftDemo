//
//  MYMBProgress.swift
//  sijieduProject
//
//  Created by qiong on 2018/1/25.
//  Copyright © 2018年 qiong. All rights reserved.
//

import UIKit
enum ProgressEnum{
    case Successful
    case Error
    case Warning
    case Info
}


let font_size = CGFloat(15.0)
let opacity = CGFloat(0.85)
class MYMBProgress {
    let JLMBProgressMsgLoading : String = "正在加载..."
    let JLMBProgressMsgError : String = "加载失败"
    let JLMBProgressMsgSuccessful : String = "加载成功"
    let JLMBProgressMsgNoMoreData : String = "没有更多数据了"
    let JLMBProgressMsgTimeInterval : TimeInterval = 1.2

}
extension MYMBProgress{
  class  func JL_ShowHUDAddedToView(view : UIView, title : String, animated : Bool)  {
        let HUD = MBProgressHUD.showAdded(to: view, animated: animated)
        HUD.label.font = UIFont.systemFont(ofSize: 15)
        HUD.label.text = title
        HUD.bezelView.alpha = 0.85
     
    }
  class  func JL_ShowHUDAddToViewWithoutAnimate(view : UIView, title : String) -> MBProgressHUD {
        
        let HUD = MBProgressHUD.showAdded(to: view, animated: true)
        HUD.label.font = UIFont.systemFont(ofSize: 15)
        HUD.label.text = title
        HUD.bezelView.alpha = 0.85
        return HUD
    }
  class  func JL_ShowViewAfterSecond(title : String, view : UIView, afterSecond : TimeInterval) {
        
        let HUD = MBProgressHUD.showAdded(to: view, animated: true)
        HUD.mode = MBProgressHUDMode.text
        HUD.label.font = UIFont.systemFont(ofSize: font_size)
        HUD.label.text = title
        HUD.bezelView.alpha = 0.85
        HUD.hide(animated: true, afterDelay: afterSecond)
       // return HUD
    }
    
    class func JL_ShowHUDHidAfterSecondWithMsgType(title : String, view : UIView, afterSecond : TimeInterval, msgType : ProgressEnum) -> MBProgressHUD {
        
        let HUD = MBProgressHUD.showAdded(to: view, animated: true)
        HUD.label.font = UIFont.systemFont(ofSize: font_size)
        let imageName = p_imageNamedWithMsgType(msgType: msgType)
        
        HUD.customView = UIImageView(image: UIImage(named: imageName))
        HUD.label.text = title
        HUD.bezelView.alpha = 0.85
        HUD.mode = MBProgressHUDMode.customView
        HUD.hide(animated: true, afterDelay: afterSecond)
        return HUD
    }
    
    /// 根据显示类型来选择背景图片
    class func p_imageNamedWithMsgType(msgType : ProgressEnum) -> String {
        var imageName = ""
        
        switch msgType {
        case .Successful:
            imageName = "bwm_hud_success"
        case .Error:
            imageName = "bwm_hud_error"
        case .Warning:
            imageName = "bwm_hud_warning"
        case .Info:
            imageName = "bwm_hud_info"
        }
        return imageName
    }
    
    class func hideAllHud(view:UIView) {
        MBProgressHUD.hide(for: view, animated: true)
    }
    
 
 
}
