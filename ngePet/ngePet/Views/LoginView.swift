//
//  LoginView.swift
//  ngePet
//
//  Created by Garry on 25/05/22.
//

import SwiftUI
import Firebase
import GoogleSignIn

struct LoginView: View {
    
    @State var isLoading: Bool = false
    
    @AppStorage("log_status") var log_status = false
    
    var body: some View {
        ZStack {
            VStack {
                
                Image("Logo Panjang")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 34)
                    .padding()
                    .padding(.bottom, 26)
                
                Image("Login Illustration")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                Text("Pawrenting, Easy Thing!")
                    .font(Font.custom("RoundedMplus1c-Bold", size: 24))
                    .padding()
                
                Button {
                    
                } label: {
                    HStack {
                        Image(systemName: "applelogo")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                        
                        Text("Masuk dengan Apple")
                            .font(Font.custom("RoundedMplus1c-Bold", size: 18))
                            .foregroundColor(.white)
                        
                    }
                    .padding(.vertical)
                    .padding(.horizontal, 32)
                    .frame(width: UIScreen.main.bounds.width - 32)
                    .background(.black)
                    .cornerRadius(100)
                }
                
                Button {
                    handleLogin()
                } label: {
                    HStack {
                        Image("Logo Google")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 16)
                        
                        
                        Text("Masuk dengan Google")
                            .font(Font.custom("RoundedMplus1c-Bold", size: 18))
                            .foregroundColor(.black)
                        
                    }
                    .padding(.vertical)
                    .padding(.horizontal, 32)
                    .frame(width: UIScreen.main.bounds.width - 32)
                    .background(.white)
                    .cornerRadius(100)
                    .overlay(
                        RoundedRectangle(cornerRadius: 100)
                            .stroke(Color("Unselected"), lineWidth: 1)
                    )
                }
                .padding(.bottom, 60)
            }
            
            ZStack {
                if isLoading {
                    Color.black
                        .opacity(0.25)
                        .ignoresSafeArea()
                    
                    ProgressView()
                        .font(.title2)
                        .frame(width: 60, height: 60)
                        .background(.white)
                        .cornerRadius(10)
                }
            }
        }
    }
    
    func handleLogin() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        let config = GIDConfiguration(clientID: clientID)
        
        isLoading = true
        
        GIDSignIn.sharedInstance.signIn(with: config, presenting: getRootViewController()) {[self] user, err in
            if let error = err {
                isLoading = false
                print(error.localizedDescription)
                return
            }
            
            guard
                let authentication = user?.authentication,
                let idToken = authentication.idToken
            else {
                isLoading = false
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
            
            Auth.auth().signIn(with: credential) { result, err in
                isLoading = false
                if let error = err {
                    print(error.localizedDescription)
                    return
                }
                
                guard let user = result?.user else {
                    return
                }
                
                print(user.displayName ?? "Success@")
                
                withAnimation {
                    log_status = true
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
    
    func getRootViewController() -> UIViewController {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }
        
        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }
        
        return root
    }
}
