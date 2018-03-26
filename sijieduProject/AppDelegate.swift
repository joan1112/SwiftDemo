//
//  AppDelegate.swift
//  sijieduProject
//
//  Created by qiong on 2017/12/25.
//  Copyright © 2017年 qiong. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame:UIScreen.main.bounds);
        let guide = GuideViewController();
        window?.rootViewController=guide;
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent

//        let numbers = [1,2,3,4]
//        let result = numbers.map { (num) -> String in
//            let str:String = String(num)
//
//            return str
//        }
//
//        let result11 = numbers.reduce(10) { (int1, int2) -> Int in
//            return int1 + int2
//        }
//
        
        let dic11 = ["userID":"123455","userName":"yaha","tele":"15801701920"]
        SingleInstance.defaultSingleInstance().setUserModelWithDic(dic: dic11)
     
//        let tabbar = MainTabbarViewController()
//        window?.rootViewController = tabbar
      
    
       
        window?.makeKeyAndVisible();
        let bounds = minMax(array: [])
        print(bounds?.min ?? 0)
        
        let names = ["as","d","ds","af","bv"]
        let reverser = names.sorted(by: >)
        print(reverser)
        
        
        
        
        
        return true
    }
    func minMax(array: [Int]) -> (min: Int, max: Int)? {
        if array.isEmpty {
            return nil;
        }
        var currentMin = array[0]
        var currentMax = array[0]
        for value in array[1..<array.count] {
            if value < currentMin {
                currentMin = value
            } else if value > currentMax {
                currentMax = value
            }
        }
        return (currentMin, currentMax)
    }
   
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

