//
//  DoctorDetailView.swift
//  ngePet
//
//  Created by Garry on 29/05/22.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI

struct DoctorDetailView: View {
    @ObservedObject var vm = CreateNewMessageViewModel()
    let user: ChatUser?
    @State var flag = false
    let time = 3.0
    
    var body: some View {
        ZStack {
            VStack {
                VStack(alignment: .leading) {
                    ZStack {
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                            .foregroundColor(.white)
                        
                        if user?.profileImageUrl != "" {
                            WebImage(url: URL(string: user?.profileImageUrl ?? ""))
                                .resizable()
                                .scaledToFill()
                                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                                .clipped()
                        }
                    }
                    
                    Text(user?.nama ?? "")
                        .font(Font.custom("RoundedMplus1c-ExtraBold", size: 24))
                        .padding(.horizontal)
                    
                    HStack {
                        Image(systemName: "star.fill")
                            .font(.system(size: 15))
                            .foregroundColor(Color("Yellow"))
                        
                        Text("\(user?.rate ?? "")  |  \(user?.jarak ?? "") km")
                            .font(Font.custom("RoundedMplus1c-Medium", size: 15))
                            .foregroundColor(Color("TextSub"))
                            .lineLimit(1)
                    }
                    .padding(.horizontal)
                    
                    Text(user?.lokasi ?? "")
                        .font(Font.custom("RoundedMplus1c-Regular", size: 15))
                        .padding(.horizontal)
                    
                    Divider()
                    
                    HStack {
                        Image(systemName: "message.fill")
                            .font(.system(size: 15))
                            .foregroundColor(Color("Brown"))
                        
                        Text(user?.harga ?? "")
                            .font(Font.custom("RoundedMplus1c-Medium", size: 18))
                            .foregroundColor(.black)
                            .lineLimit(1)
                            .padding(.trailing, 4)
                        
                        Image(systemName: "stethoscope")
                            .font(.system(size: 15))
                            .foregroundColor(Color("Brown"))
                        
                        Text(user?.harga2 ?? "")
                            .font(Font.custom("RoundedMplus1c-Medium", size: 18))
                            .foregroundColor(.black)
                            .lineLimit(1)
                    }
                    .padding(.horizontal)
                    
                    Divider()
                }
                
                VStack {
                    Spacer()
                    HStack {
                        ForEach(vm.users[0..<1]) { doctor in
                            NavigationLink {
                                MessageRoomView(chatUser: doctor)
                                
                            } label: {
                                Text("Konsultasi Online")
                                    .font(Font.custom("RoundedMplus1c-ExtraBold", size: 15))
                                    .foregroundColor(.black)
                                    .padding(.vertical, 12)
                                    .padding(.horizontal, 22)
                                    .cornerRadius(100)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 100)
                                            .stroke(Color("Unselected"), lineWidth: 0.5)
                                    )
                            }
                        }
                        
                        Button {
                            flag.toggle()
                        } label: {
                            Text("Medical Check-Up")
                                .font(Font.custom("RoundedMplus1c-ExtraBold", size: 15))
                                .foregroundColor(.white)
                                .padding(.vertical, 12)
                                .padding(.horizontal, 22)
                                .background(Color("Brown"))
                                .cornerRadius(100)
                        }
                    }
                }
                
            }
            
            if flag {
                TransaksiSukses(flag: $flag, showTime: time, text: "Medical Chek-Up Diajukan")
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    Text("Detail Peliharaan")
                        .font(Font.custom("RoundedMplus1c-ExtraBold", size: 18))
                    
                    Spacer()
                }
            }
        }
    }
}


struct DoctorDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
