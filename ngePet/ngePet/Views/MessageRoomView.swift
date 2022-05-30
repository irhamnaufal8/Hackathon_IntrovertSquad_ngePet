//
//  MessageRoomView.swift
//  ngePet
//
//  Created by Garry on 25/05/22.
//

import SwiftUI
import SDWebImageSwiftUI
import Firebase

struct MessageRoomView: View {
    let user: ChatUser?
    
    init(chatUser: ChatUser?) {
        self.user = chatUser
        self.vm = .init(chatUser: chatUser)
    }
    
    @ObservedObject var vm: MessageRoomViewModel
    
    static let scrollTo = "Empty"
    
    var body: some View {
        ZStack {
            VStack {
                ScrollView {
                    ScrollViewReader { scrollViewProxy in
                        VStack {
                            ForEach(vm.chatMessages) { message in
                                BubbleChat(message: message)
                            }
                            
                            HStack { Spacer() }
                                .id(Self.scrollTo)
                        }
                        .onReceive(vm.$count) { _ in
                            withAnimation(.easeOut(duration: 0.5)) {
                                scrollViewProxy.scrollTo(Self.scrollTo, anchor: .bottom)
                            }
                        }
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            WebImage(url: URL(string: user?.profileImageUrl ?? ""))
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .clipped()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 100)
                                        .stroke(Color("Unselected"), lineWidth: 0.5)
                                )
                                .cornerRadius(100)
                            
                            Text(user?.nama ?? "")
                                .font(Font.custom("RoundedMplus1c-ExtraBold", size: 15))
                            
                            Spacer()
                        }
                    }
                }
                
                Spacer()
                
                VStack {
                    Divider()
                    
                    HStack {
                        Image(systemName: "photo")
                            .font(.system(size: 26))
                            .foregroundColor(Color("Brown"))
                        
                        TextField("Halo, aku mau nanya..", text: $vm.chatText)
                            .textFieldStyle(.roundedBorder)
                            .font(Font.custom("RoundedMplus1c-Regular", size: 12))
                            .foregroundColor(Color("TextSub"))
                        
                        Button {
                            if vm.chatText != "" {
                                vm.handleSend(text: self.vm.chatText)
                            }
                        } label: {
                            Image(systemName: "paperplane.circle.fill")
                                .font(.system(size: 26))
                                .foregroundColor(Color("Brown"))
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 2)
                }
                .background(.white)
            }
        }
    }
}

struct MessageRoomView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MessageRoomView(chatUser: .init(data: ["nama": "drh. Ali Abwaba", "profileImageUrl": "https://firebasestorage.googleapis.com/v0/b/ngepet-df5a8.appspot.com/o/drh.%20Ali%20Abwaba.png?alt=media&token=ab8e4ab2-03c5-4698-8f95-b3bbeec463e5", "uid": "1LwsA2QX2M7ummBElh0q"]))
        }
    }
}
