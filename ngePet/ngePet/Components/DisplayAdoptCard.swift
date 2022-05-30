//
//  DisplayAdoptCard.swift
//  ngePet
//
//  Created by Garry on 17/05/22.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI

struct DisplayAdoptCard: View {
    
    let adopt: PetAdopt?
    
    var body: some View {
        ZStack {
            Loader()
                .frame(width: 132, height: 170)
                .background(Color("SoftPink"))
                .cornerRadius(12)
            
            if adopt?.imageUrl != "" {
                VStack {
                    WebImage(url: URL(string: adopt?.imageUrl ?? ""))
                        .resizable()
                        .scaledToFit()
                        .padding(-20)
                        .frame(maxWidth: 132, maxHeight: 92)
                        .clipped()
                    
                    Rectangle()
                        .frame(width: .infinity, height: 0.5)
                        .foregroundColor(Color("Unselected"))
                        .padding(.top, -7)
                    
                    HStack {
                        Text(adopt?.namaHewan ?? "")
                            .lineLimit(1)
                            .font(Font.custom("RoundedMplus1c-ExtraBold", size: 12))
                            .foregroundColor(.black)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Text(adopt?.lokasi ?? "")
                            .font(Font.custom("RoundedMplus1c-Regular", size: 10))
                            .foregroundColor(.black)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Text(adopt?.harga ?? "")
                            .font(Font.custom("RoundedMplus1c-ExtraBold", size: 12))
                            .foregroundColor(.black)
                        
                        Spacer()
                    }
                    
                }
                .padding(5)
                .frame(width: 132, height: 170)
                .background(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color("Unselected"), lineWidth: 0.5)
                )
            }
        }
    }
}

struct DisplayAdoptCard_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
