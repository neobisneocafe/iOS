//
//  AppDelegate.swift
//  NeoCafe
//
//  Created by Adinay on 3/6/23.
//

import UIKit
import IQKeyboardManagerSwift
import netfox

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var navController = UINavigationController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "Готово"
        
        NFX.sharedInstance().start()
        
        let window  = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        window.makeKeyAndVisible()
        launchApp()
        window.makeKeyAndVisible()
        return true
        
        // Проверка пользователя на авторизацию
        //        if (DSGenerator.sharedInstance.getAccessToken()) != nil {
        //            mainApp()
        //        } else {
        //            launchApp()
        //        }
        //        return true
    }
    
    func launchApp() {
        navController(vc: LaunchScreenViewController())
        self.window?.rootViewController = navController
    }
    
    func mainApp() {
        navController(vc: MainTabBarController())
        self.window?.rootViewController = navController
    }
    
    func navController(vc: UIViewController){
        navController = UINavigationController(rootViewController:  vc)
        navController.navigationBar.isHidden = true
    }
}
