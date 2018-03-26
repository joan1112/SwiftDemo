//
//  GuideViewController.swift
//  sijieduProject
//
//  Created by qiong on 2017/12/29.
//  Copyright © 2017年 qiong. All rights reserved.
//

import UIKit
import SnapKit
class GuideViewController: UIViewController {
    var bgscroll:UIScrollView?
    let page = 3
    var pageIndictor:CusPageControlWithView? = nil
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.gray;
       
        bgscroll = UIScrollView(frame:self.view.bounds);
        bgscroll?.isPagingEnabled = true
        bgscroll?.delegate = self
        self.view.addSubview(bgscroll!)
        bgscroll?.contentSize = CGSize(width:self.view.frame.size.width * 3,height:0)
        bgscroll?.backgroundColor = UIColor.init(hexString: "087ecc")
        bgscroll?.showsHorizontalScrollIndicator=false
        creatContent();
    }
    func creatContent(){
        for index in 0...page {
            let images = "welcome" + String(index+1)
            let imageView = UIImageView()
            imageView.frame = CGRect(x: CGFloat(index) * kScreenWidth, y: kScreenWidth/5.5, width: kScreenWidth, height: kScreenWidth/1.17)
            imageView.image = UIImage.init(named: images);
            bgscroll?.addSubview(imageView)
            if index==page-1{
                let btn = UIButton()
               bgscroll!.addSubview(btn)
                btn.setTitle("立即体验", for: UIControlState.normal)
                btn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
                btn.layer.cornerRadius = 4
                btn.layer.masksToBounds = true
                btn.addTarget(self, action: #selector(btnClick(_:)), for: UIControlEvents.touchUpInside)
                btn.backgroundColor = UIColor.init(hexString: "F5C70F")
               btn.frame = CGRect.init(x: kScreenWidth*2+(kScreenWidth/2-80/2), y: kScreenHeight*0.86, width: 80, height: 40)
                
            }
      }
        
       pageIndictor = CusPageControlWithView.init(CGRect.init(x: kScreenWidth/2 - 50, y: kScreenHeight-80, width: 100, height: 30), pageNum: 3, currentPageIndex: 0, currentShow: UIImage.init(named: "slidePoint"), pageIndicatorShow: UIImage.init(named: "slideCirclePoint"))
        
        self.view.addSubview(pageIndictor!)
    }
    
    func creatCircle(){
    //let page = c
    
    }
   @objc fileprivate  func btnClick(_ sender:UIButton) {
        let rootvc = UIApplication.shared.delegate?.window
        rootvc??.rootViewController=MainTabbarViewController()
   
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension GuideViewController:UIScrollViewDelegate{
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let getNum = scrollView.contentOffset.x/scrollView.zc_width
        let page:Int = Int(getNum)
        
        pageIndictor?.indexNumWithSlide = page
        if page == 2{
            pageIndictor?.isHidden = true
        }else{
            pageIndictor?.isHidden = false
        }
    
        
    }
}


