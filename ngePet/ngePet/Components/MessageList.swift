//
//  MessageList.swift
//  ngePet
//
//  Created by Garry on 25/05/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct MessageList: View {
    var recentMessage: RecentMessage?
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    
                    WebImage(url: URL(string: recentMessage?.profileImageUrl ?? ""))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 70)
                        .clipped()
                        .cornerRadius(100)
                    
                    Image(systemName: recentMessage?.dokter ?? true ? "stethoscope.circle.fill" : "bag.circle.fill")
                        .padding(-2)
                        .foregroundColor(recentMessage?.dokter ?? true ? Color("Cyan") : Color("Red"))
                        .font(.system(size: 20))
                        .background(.white)
                        .cornerRadius(100)
                        .padding(.top, -35)
                        .padding(.leading, 4)
                        .padding(.bottom, -16)
                }
                
                VStack {
                    HStack {
                        Text(recentMessage?.nama ?? "")
                            .font(Font.custom("RoundedMplus1c-Bold", size: 15))
                            .foregroundColor(recentMessage?.read ?? true ? Color("TextSub") : .black)
                            .lineLimit(1)
                        
                        Spacer()
                        
                        Text("8.12")
                            .font(Font.custom("RoundedMplus1c-Medium", size: 10))
                    }
                    .padding(.bottom, -3)
                    
                    HStack {
                        Text(recentMessage?.text ?? "Ada pesan baru")
                            .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                            .foregroundColor(recentMessage?.read ?? true ? Color("TextSub") : .black)
                            .lineLimit(1)
                        
                        Spacer()
                        
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(recentMessage?.read ?? true ? .white : Color("Blue"))
                    }
                    .padding(.top, -3)
                }
            }
        }
        .padding(.horizontal)
    }
}

struct MessageList_Previews: PreviewProvider {
    static var previews: some View {
        MessagesListView()
    }
}
