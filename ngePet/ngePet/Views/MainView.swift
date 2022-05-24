//
//  MainView.swift
//  ngePet
//
//  Created by Garry on 16/05/22.
//

import SwiftUI

struct MainView: View {
    
    init() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().backgroundColor = .white
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TabView {
                    HomeView()
                        .tabItem {
                            Image("home.fill")
                                .font(.system(size: 24))
                        }
                    
                    PetshopView()
                        .tabItem {
                            Image(systemName: "cart.fill")
                        }
                    
                    ForumView()
                        .tabItem {
                            Image(systemName: "bubble.left.and.bubble.right.fill")
                        }
                    
                    DoctorView()
                        .tabItem {
                            Image("medicine.fill")
                                .font(.system(size: 22))
                        }
                    
                    ProfileView()
                        .tabItem {
                            Image(systemName: "person.fill")
                        }
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
            }
        }
        .accentColor(Color("Brown"))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
