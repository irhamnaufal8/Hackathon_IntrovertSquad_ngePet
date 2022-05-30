//
//  ParentProfileView.swift
//  ngePet
//
//  Created by Garry on 26/05/22.
//

import SwiftUI
import Firebase
import GoogleSignIn

struct ParentProfileView: View {
    @State private var showingAlert = false
    @AppStorage("log_status") var log_status = false
    
    var body: some View {
        VStack {
            Image(systemName: "person.circle.fill")
                .font(.system(size: 100))
                .foregroundColor(Color("Unselected"))
                .padding()
                .padding(.vertical, 60)
            
            List {
                HStack {
                    Image(systemName: "person.crop.square")
                        .font(.system(size: 40))
                        .foregroundColor(Color("Purple"))
                        .padding(.trailing, 32)
                        .padding(.leading)
                    
                    
                    Text("Irham Naufal")
                        .font(Font.custom("RoundedMplus1c-Medium", size: 18))
                    
                    Spacer()
                    
                }
                .padding(.vertical, -2)
                
                HStack {
                    Image(systemName: "phone.bubble.left")
                        .font(.system(size: 34))
                        .foregroundColor(Color("Green"))
                        .padding(.trailing, 32)
                        .padding(.leading)
                    
                    Text("+62 852-5679-0118")
                        .font(Font.custom("RoundedMplus1c-Medium", size: 18))
                    
                    Spacer()
                    
                }
                .padding(.vertical, -2)
                
                HStack {
                    Image(systemName: "mail")
                        .font(.system(size: 34))
                        .foregroundColor(Color("Blue"))
                        .padding(.trailing, 32)
                        .padding(.leading)
                    
                    Text("inaufal77@gmail.com")
                        .foregroundColor(.black)
                        .font(Font.custom("RoundedMplus1c-Medium", size: 18))
                    
                    Spacer()
                    
                }
                .padding(.vertical, -2)
                
                Button {
                    showingAlert = true
                } label: {
                        HStack {
                            Image(systemName: "power")
                                .font(.system(size: 32))
                                .foregroundColor(Color("Red"))
                                .padding(.trailing, 42)
                                .padding(.leading, 20)
                            
                            Text("Keluar")
                                .foregroundColor(Color("Red"))
                                .font(Font.custom("RoundedMplus1c-Bold", size: 18))
                            
                            Spacer()
                            
                        }
                        .padding(.vertical, -2)
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Keluar dari akun?"),
                          message: Text("Kamu harus masuk kembali untuk menggunakan aplikasi ini."),
                          primaryButton: .destructive(Text("Ya")) {
                        GIDSignIn.sharedInstance.signOut()
                        try? Auth.auth().signOut()
                        
                        withAnimation {
                            log_status = false
                        }
                    },
                          secondaryButton: .cancel()
                    )
                }
            }
            .listStyle(PlainListStyle())

            
            Spacer()
            
            Text("Version 1.0 Beta")
                .foregroundColor(.black)
                .font(Font.custom("RoundedMplus1c-Regular", size: 15))
                .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    Text("Profil Saya")
                        .font(Font.custom("RoundedMplus1c-ExtraBold", size: 18))
                    
                    Spacer()
                }
            }
        }
        
    }
}

struct ParentProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ParentProfileView()
    }
}
