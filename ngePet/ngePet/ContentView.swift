//
//  ContentView.swift
//  ngePet
//
//  Created by Garry on 15/05/22.
//

import SwiftUI
import Firebase
import GoogleSignIn

struct ContentView: View {
    
    @AppStorage("log_status") var log_status = false
    
    var body: some View {
        
        VStack {
            if log_status {
                MainView()
            } else {
                LoginView()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
