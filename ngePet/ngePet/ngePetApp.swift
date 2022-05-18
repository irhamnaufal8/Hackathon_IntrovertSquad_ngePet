//
//  ngePetApp.swift
//  ngePet
//
//  Created by Garry on 15/05/22.
//

import SwiftUI
import Firebase

@main
struct ngePetApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        
        WindowGroup {
            ContentView()
        }
    }
}
