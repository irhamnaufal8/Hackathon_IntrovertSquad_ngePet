//
//  MessagesListView.swift
//  ngePet
//
//  Created by Garry on 25/05/22.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI

struct MessagesListView: View {
    
    @ObservedObject var vm = MessagesListViewModel()
    
    var body: some View {
        ScrollView {
            ForEach(vm.recentMessages) { recentMessage in
                NavigationLink {
                    MessageRoomView(chatUser: vm.chatUser)
                } label: {
                    VStack {
                        HStack {
                            VStack(alignment: .leading) {
                                
                                WebImage(url: URL(string: recentMessage.profileImageUrl))
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 70, height: 70)
                                    .clipped()
                                    .cornerRadius(100)
                                
                                Image(systemName: recentMessage.dokter ? "stethoscope.circle.fill" : "bag.circle.fill")
                                    .padding(-2)
                                    .foregroundColor(Color("Cyan"))
                                    .font(.system(size: 20))
                                    .background(.white)
                                    .cornerRadius(100)
                                    .padding(.top, -35)
                                    .padding(.leading, 4)
                                    .padding(.bottom, -16)
                            }
                            
                            VStack {
                                HStack {
                                    Text(recentMessage.nama)
                                        .font(Font.custom("RoundedMplus1c-Bold", size: 15))
                                        .foregroundColor(Color("TextSub"))
                                        .lineLimit(1)
                                    
                                    Spacer()
                                    
                                    Text(recentMessage.timestamp.formatted(.dateTime.hour().minute()))
                                        .font(Font.custom("RoundedMplus1c-Medium", size: 10))
                                }
                                .padding(.bottom, -3)
                                
                                HStack {
                                    Text(recentMessage.text)
                                        .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                                        .foregroundColor(Color("TextSub"))
                                        .lineLimit(1)
                                    
                                    Spacer()
                                    
                                    Circle()
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(.white)
                                }
                                .padding(.top, -3)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                Divider()

            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    Text("Pesan")
                        .font(Font.custom("RoundedMplus1c-ExtraBold", size: 18))
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.black)
                    }
                    
                }
            }
        }
    }
}

struct MessagesListView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesListView()
    }
}
