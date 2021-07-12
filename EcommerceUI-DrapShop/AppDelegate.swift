//
//  AppDelegate.swift
//  EcommerceUI-DrapShop
//
//  Created by Laborit on 5/07/21.
//

import UIKit
import Firebase;

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}
