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
            Button {
                showingAlert = true
            } label: {
                Text("Keluar")
                    .font(Font.custom("RoundedMplus1c-Bold", size: 15))
                    .foregroundColor(Color("Red"))
                    .padding()
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
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    Text("Profil")
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
