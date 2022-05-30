//
//  BubbleChat.swift
//  ngePet
//
//  Created by Garry on 28/05/22.
//

import SwiftUI
import Firebase

struct BubbleChat: View {
    let message: ChatMessage
    
    var body: some View {
        VStack {
            if message.fromId == FirebaseManager.shared.auth.currentUser?.uid {
                HStack {
                    Spacer()
                    HStack {
                        Text(message.text)
                            .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                            .foregroundColor(.white)
                    }
                    .padding(5)
                    .padding(.horizontal, 8)
                    .background(Color("Brown"))
                    .cornerRadius(12)
                }
            } else {
                HStack {
                    HStack {
                        Text(message.text)
                            .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                            .foregroundColor(.black)
                    }
                    .padding(5)
                    .padding(.horizontal, 8)
                    .background(Color("Unselected"))
                    .cornerRadius(12)
                    
                    Spacer()
                }
            }
        }
        .padding(.horizontal)
    }
}
