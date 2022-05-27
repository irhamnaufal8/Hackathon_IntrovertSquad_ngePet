//
//  ngePetApp.swift
//  ngePet
//
//  Created by Garry on 15/05/22.
//

import SwiftUI
import Firebase
import GoogleSignIn

@main
struct ngePetApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
    
    func application(_ application: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any])
    -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
}
