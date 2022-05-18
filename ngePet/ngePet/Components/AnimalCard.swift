//
//  AnimalCard.swift
//  ngePet
//
//  Created by Garry on 17/05/22.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI

struct AnimalCard: View {
    var hewan: String
    var namaHewan: String
    
    var body: some View {
        ZStack {
            if hewan == "kucing" {
                Rectangle()
                    .frame(width: .infinity, height: 150)
                    .foregroundColor(Color("SoftBrown"))
                    .cornerRadius(34)
                    .padding(.horizontal)
            } else if hewan == "anjing" {
                Rectangle()
                    .frame(width: .infinity, height: 150)
                    .foregroundColor(Color("SoftBlue"))
                    .cornerRadius(34)
                    .padding(.horizontal)
            } else {
                Rectangle()
                    .frame(width: .infinity, height: 150)
                    .foregroundColor(Color("SoftGreen"))
                    .cornerRadius(34)
                    .padding(.horizontal)
            }
            
            HStack {
                ZStack {
                    Circle()
                        .foregroundColor(Color("Orange"))
                        .frame(maxWidth: 98, maxHeight: 98)
                    Image("DefaultAvatar")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 73, maxHeight:62)
                }
                
                VStack(alignment: .leading) {
                    Text(namaHewan)
                        .lineLimit(1)
                        .font(Font.custom("RoundedMplus1c-ExtraBold", size: 15))
                    
                    Text(hewan)
                        .lineLimit(1)
                        .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                        .foregroundColor(Color("TextSub"))
                    
                    Text("2 Tahun 2 Bulan")
                        .lineLimit(1)
                        .font(Font.custom("RoundedMplus1c-Regular", size: 12))
                        .foregroundColor(Color("TextDesc"))
                }
                .padding(.horizontal)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 32))
                    .foregroundColor(Color("TextDesc"))
            }
            .padding(.horizontal, 40)
        }
    }
}

struct AnimalCard_Previews: PreviewProvider {
    static var previews: some View {
        AnimalCard(hewan: "kucing", namaHewan: "Meng")
    }
}
