//
//  DoctorCard.swift
//  ngePet
//
//  Created by Garry on 27/05/22.
//

import SwiftUI
import SDWebImageSwiftUI
import Firebase

struct DoctorCard: View {
    
    let user: ChatUser?
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    
                    ZStack {
                        WebImage(url: URL(string: user?.profileImageUrl ?? ""))
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 120)
                            .clipped()
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("Unselected"), lineWidth: 0.5)
                            )
                            .cornerRadius(10)
                        
                        Image("LaunchScreen Logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16)
                            .padding(.leading, -40)
                            .padding(.top, -50)
                    }
                }
                .padding(.trailing,8)
                
                VStack(alignment: .leading) {
                    Text(user?.nama ?? "")
                        .font(Font.custom("RoundedMplus1c-Bold", size: 15))
                        .foregroundColor(.black)
                        .lineLimit(1)
                    
                    HStack {
                        Image(systemName: "star.fill")
                            .font(.system(size: 13))
                            .foregroundColor(Color("Yellow"))
                        
                        Text("\(user?.rate ?? "")  |  \(user?.jarak ?? "") km")
                            .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                            .foregroundColor(Color("TextSub"))
                            .lineLimit(1)
                    }
                    
                    Text(user?.lokasi ?? "")
                        .font(Font.custom("RoundedMplus1c-Regular", size: 12))
                        .foregroundColor(Color("TextDesc"))
                        .lineLimit(1)
                        .padding(.bottom, 8)
                    
                    HStack {
                        Image(systemName: "message.fill")
                            .font(.system(size: 13))
                            .foregroundColor(Color("Brown"))
                        
                        Text(user?.harga ?? "")
                            .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                            .foregroundColor(.black)
                            .lineLimit(1)
                            .padding(.trailing, 4)
                        
                        Image(systemName: "stethoscope")
                            .font(.system(size: 13))
                            .foregroundColor(Color("Brown"))
                        
                        Text(user?.harga2 ?? "")
                            .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                            .foregroundColor(.black)
                            .lineLimit(1)
                    }
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

struct DoctorCard_Previews: PreviewProvider {
    static var previews: some View {
        DoctorListView()
    }
}
