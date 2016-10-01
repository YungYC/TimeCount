//
//  AppDelegate.swift
//  TimeCount
//
//  Created by Duncan on 2016/3/4.
//  Copyright © 2016年 Duncan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, performActionForShortcutItem shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void) {
        completionHandler(handleQuickAction(shortcutItem))
    }
    
    enum Shortcut: String{
        case quickStart1 = "QuickStart1"
        case quickStart2 = "QuickStart2"
    }
    
    func handleQuickAction(shortcutItem:UIApplicationShortcutItem) -> Bool {
        var quickActionHandled = false
        let type = shortcutItem.type.componentsSeparatedByString(".").last!
        if let shortcutType = Shortcut.init(rawValue: type){
            switch shortcutType {
            case .quickStart1:
                //dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(0.1*Double(NSEC_PER_SEC))), dispatch_get_main_queue(), {
                    let tapBarViewController = self.window?.rootViewController as! UITabBarController
                    let firstViewController = tapBarViewController.viewControllers![0] as! FirstViewController
                    firstViewController.playButton0.sendActionsForControlEvents(.TouchUpInside)
                //})
                quickActionHandled = true
            default:
                break
            }
        }
        return quickActionHandled
    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

