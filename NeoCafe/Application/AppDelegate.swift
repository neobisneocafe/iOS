//
//  AppDelegate.swift
//  NeoCafe
//
//  Created by Adinay on 3/6/23.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var navController = UINavigationController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "Готово"
        
        let window  = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        window.makeKeyAndVisible()
        
        DSGenerator.sharedInstance.setAccessToken("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiZmlyc3ROYW1lIjoiU2FyZGFyIiwicGhvbmVOdW1iZXIiOiI5OTY3MDQwMjI4MzIiLCJyb2xlIjoiVVNFUiIsImlhdCI6MTY5MTY1NjEyMSwiZXhwIjoxNjkyMjYwOTIxfQ.N-VC8xJTrA5JPpgF8W2ltXGkW66fDwzpb5fm9P3B7vA")
        
        // Проверка пользователя на авторизацию
        if (DSGenerator.sharedInstance.getAccessToken()) != nil {
            mainApp()
        } else {
            launchApp() 
        }
     
        return true
        
//        launchApp()
//        window.makeKeyAndVisible()
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

