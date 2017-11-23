//
//  AppDelegate.swift
//  HFPicker
//
//  Created by 韩艳锋 on 2017/11/23.
//  Copyright © 2017年 韩艳锋. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        class RiQi:NSObject, PickModelProtocol {
            let showIdStr: [String]
            init(arr:[String]) {
                showIdStr = arr
            }
            override var description: String {
                return "RiQi: \(showIdStr)"
            }
        }
        
        let dataArr = [
            ["2016","01","01"],
            ["2016","01","02"],
            ["2016","01","03"],
            ["2016","01","04"],
            ["2016","02","01"],
            ["2016","02","02"],
            ["2016","02","03"],
            ["2016","02","04"],
            ["2016","03","01"],
            ["2016","03","02"],
            ["2016","03","03"],
            ["2016","03","04"],
            ["2016","04","01"],
            ["2016","04","02"],
            ["2016","04","03"],
            ["2016","04","04"],
            ["2017","01","01"],
            ["2017","01","02"],
            ["2017","01","03"],
            ["2017","01","04"],
            ["2017","02","01"],
            ["2017","02","02"],
            ["2017","02","03"],
            ["2017","02","04"],
            ["2017","03","01"],
            ["2017","03","02"],
            ["2017","03","03"],
            ["2017","03","04"],
            ["2017","04","01"],
            ["2017","04","02"],
            ["2017","04","03"],
            ["2017","04","04"],
            ["2015","01","01"],
            ["2015","01","02"],
            ["2015","01","03"],
            ["2015","01","04"],
            ["2015","02","01"],
            ["2015","02","02"],
            ["2015","02","03"],
            ["2015","02","04"],
            ["2015","03","01"],
            ["2015","03","02"],
            ["2015","03","03"],
            ["2015","03","04"],
            ["2015","04","01"],
            ["2015","04","02"],
            ["2015","04","03"],
            ["2015","04","04"],
            ["2014","01","01"],
            ["2014","01","02"],
            ["2014","01","03"],
            ["2014","01","04"],
            ["2014","02","01"],
            ["2014","02","02"],
            ["2014","02","03"],
            ["2014","02","04"],
            ["2014","03","01"],
            ["2014","03","02"],
            ["2014","03","03"],
            ["2014","03","04"],
            ["2014","04","01"],
            ["2014","04","02"],
            ["2014","04","03"],
            ["2014","04","04"]
        ]
        
        var classDataArr: [RiQi] = []
        
        for item in dataArr {
            classDataArr.append(RiQi(arr: item))
        }
        let pickModel = PickModel(data: classDataArr)
        print("当前每列的数据为!\(pickModel.currentColAndRowStrArr)")
        print("当前的值为：\(pickModel.currentValue)")
        
        print("第1列滑动到第2行")
        print(pickModel.滑动第X(列: 1, 到第X行: 2))
        print("当前的值为：\(pickModel.currentValue)")
        
        print("第0列滑动到第2行")
        print(pickModel.滑动第X(列: 0, 到第X行: 2))
        print("当前的值为：\(pickModel.currentValue)")

        print("第1列滑动到第2行")
        print(pickModel.滑动第X(列: 1, 到第X行: 2))
        print("当前的值为：\(pickModel.currentValue)")

        return true
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

