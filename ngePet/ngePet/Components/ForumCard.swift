//
//  ForumCard.swift
//  ngePet
//
//  Created by Garry on 24/05/22.
//

import SwiftUI

struct ForumCard: View {
    var image: String = ""
    @State private var isLike = false
    @State private var isUnlike = false
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.circle.fill")
                    .font(.system(size: 40))
                    .foregroundColor(Color("Unselected"))
                
                VStack(alignment: .leading) {
                    Text("Omar Dhani")
                        .font(Font.custom("RoundedMplus1c-Bold", size: 15))
                    
                    Text("12 April 2022")
                        .font(Font.custom("RoundedMplus1c-Regular", size: 12))
                        .foregroundColor(Color("TextDesc"))
                }
                
                Spacer()
                
                Image(systemName: "ellipsis")
                    .font(.system(size: 20))
                    .foregroundColor(Color("TextDesc"))
            }
            .padding(.horizontal)
            .padding(.top, 8)
            
            Text("Ini makanannya kadaluarsa atau kenapa ya? Kok ada bintik-bintik kaya gini.")
                .font(Font.custom("RoundedMplus1c-Regular", size: 13))
                .foregroundColor(Color("TextSub"))
                .padding(.horizontal)
                .padding(.top, 8)
            
            if image != "" {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 180)
            }
            
            HStack {
                Image(systemName: "hand.thumbsup.fill")
                    .font(.system(size: 12))
                    .foregroundColor(Color("Brown"))
                
                Text("0%  |  0")
                    .font(Font.custom("RoundedMplus1c-Regular", size: 8))
                    .foregroundColor(Color("TextDesc"))
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 8)
            
            Rectangle()
                .frame(width: .infinity, height: 1)
                .foregroundColor(Color("Unselected"))
                .padding(.horizontal, 4)
                .padding(.top, 8)
            
            HStack {
                Button {
                    isLike.toggle()
                    isUnlike = false
                } label: {
                    Image(systemName: "hand.thumbsup.fill")
                        .font(.system(size: 12))
                        
                    Text("Suka")
                        .font(Font.custom("RoundedMplus1c-Bold", size: 12))
                }
                .foregroundColor(isLike ? Color("Brown") : Color("Unselected"))
                
                Button {
                    isUnlike.toggle()
                    isLike = false
                } label: {
                    Image(systemName: "hand.thumbsdown.fill")
                        .font(.system(size: 12))
                        
                    Text("Tidak Suka")
                        .font(Font.custom("RoundedMplus1c-Bold", size: 12))
                }
                .foregroundColor(isUnlike ? Color("Brown") : Color("Unselected"))
                .padding(.horizontal)
                
                Button {
                    
                } label: {
                    Image(systemName: "text.bubble.fill")
                        .font(.system(size: 12))
                        
                    Text("Komentar")
                        .font(Font.custom("RoundedMplus1c-Bold", size: 12))
                }
                .foregroundColor(Color("Unselected"))
                
                
            }
            .padding(.horizontal)
            .padding(.bottom, 8)
        }
        .frame(width: .infinity)
        .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color("Unselected"), lineWidth: 0.5)
            )
        .padding(.horizontal)
    }
}

struct ForumCard_Previews: PreviewProvider {
    static var previews: some View {
        ForumCard()
    }
}
