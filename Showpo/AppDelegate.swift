//
//  AppDelegate.swift
//  Showpo
//
//  Created by Thadz on 17/10/2016.
//  Copyright © 2016 Thousandminds. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics

import Neon

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        //replace ViewController with proper home (tab) view controller
//        let viewController = ViewController()
        
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window?.backgroundColor = UIColor.whiteColor()
        self.window?.makeKeyAndVisible()
        
//        let tabBarController = ShowpoTabBarController()
//        tabBarController.selectedIndex = 2
//        self.window?.rootViewController = tabBarController
        
        createSlideMenu()
        
        let splashImage = UIImageView(image: UIImage(named: "splashScreen"))
        self.window?.addSubview(splashImage)
        splashImage.fillSuperview()
        
        let showpoLogo = UIImageView(image: UIImage(named: "showpo_logo"))
        self.window?.addSubview(showpoLogo)
        showpoLogo.anchorInCenter(width: 314.0, height: 54.0)
        
        //showpo_logo-small
        let smallImage = UIImage(named: "showpo_logo-small")
        UIView.animateWithDuration(3.0,
                                   animations: {
                                    splashImage.alpha = 0.0
                                    showpoLogo.frame = CGRect(x: (self.window?.frame.size.width)!/2.0 - (smallImage?.size.width)!/2.0, y: 30.0, width: (smallImage?.size.width)!, height: (smallImage?.size.height)!)
            },
                                   completion: {
                                    (value: Bool) in
                                    splashImage.removeFromSuperview()
                                    showpoLogo.removeFromSuperview()
        })
        
//        self.createSlideMenu()
        Fabric.with([Crashlytics.self])

        
        return true
    }
    
    func createSlideMenu(){
        let tabBarController = ShowpoTabBarController()
        tabBarController.selectedIndex = 2
        
        let accountNavigation = UINavigationController()
        accountNavigation.title = "Account"
        accountNavigation.tabBarItem.image = UIImage(named: "account")
        
        let account = AccountViewController()
        account.title = "Account"
        account.tabBarItem.image = UIImage(named: "account")
        account.view.backgroundColor = UIColor.whiteColor()
        
        accountNavigation.addChildViewController(account)
        
        let frontView = tabBarController
        let rearView = accountNavigation
        
        let swRevealVC = SWRevealViewController(rearViewController: rearView, frontViewController: frontView)
        
        swRevealVC.toggleAnimationType = SWRevealToggleAnimationType.EaseOut;
        swRevealVC.toggleAnimationDuration = 0.30;
        swRevealVC.frontViewShadowColor = UIColor.clearColor()
        swRevealVC.rearViewRevealDisplacement = 160.0
        
        
        self.window?.rootViewController = swRevealVC!;
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

