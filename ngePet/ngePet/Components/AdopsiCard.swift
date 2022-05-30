//
//  AdopsiCard.swift
//  ngePet
//
//  Created by Garry on 26/05/22.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI

struct AdopsiCard: View {
    
    let adopt: PetAdopt?
    
    var body: some View {
        ZStack {
            
            Loader()
                .frame(width: 173, height: 223)
                .background(Color("SoftGreen"))
                .cornerRadius(12)
            
            if adopt?.imageUrl != "" {
                VStack {
                    WebImage(url: URL(string: adopt?.imageUrl ?? ""))
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 173, maxHeight: 121)
                        .clipped()
                    
                    Rectangle()
                        .frame(width: .infinity, height: 0.5)
                        .foregroundColor(Color("Unselected"))
                        .padding(.top, -7)
                    
                    VStack {
                        HStack {
                            Text(adopt?.namaHewan ?? "")
                                .lineLimit(1)
                                .font(Font.custom("RoundedMplus1c-ExtraBold", size: 12))
                                .foregroundColor(.black)
                            
                            Spacer()
                        }
                        
                        HStack {
                            Image(systemName: "pawprint.fill")
                                .font(.system(size: 10))
                                .foregroundColor(Color("TextDesc"))
                                .padding(.trailing, -6)
                            
                            Text(adopt?.umur ?? "")
                                .font(Font.custom("RoundedMplus1c-Regular", size: 10))
                                .foregroundColor(Color("TextDesc"))
                                .foregroundColor(.black)
                            
                            Spacer()
                        }
                        
                        HStack {
                            Text("\(adopt?.lokasi ?? "")  |  \(adopt?.jarak ?? "")")
                                .font(Font.custom("RoundedMplus1c-Regular", size: 10))
                                .foregroundColor(Color("TextSub"))
                                .foregroundColor(.black)
                            
                            Spacer()
                        }
                        
                        HStack {
                            Text(adopt?.harga ?? "")
                                .font(Font.custom("RoundedMplus1c-ExtraBold", size: 12))
                                .padding(.bottom)
                                .foregroundColor(.black)
                            
                            Spacer()
                        }
                    }
                    .padding(.horizontal)
                    
                }
                .frame(width: 173, height: 223)
                .background(.white)
                .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color("Unselected"), lineWidth: 0.5)
                )
            }
        }
    }
}
