//
//  BelanjaCard.swift
//  ngePet
//
//  Created by Garry on 26/05/22.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI

struct BelanjaCard: View {
    let product: PetProduct?
    
    var body: some View {
        ZStack {
            Loader()
                .frame(width: 173, height: 223)
                .background(Color("SoftGreen"))
                .cornerRadius(12)
            
            if product?.imageUrl != "" {
                VStack {
                    WebImage(url: URL(string: product?.imageUrl ?? ""))
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 173, maxHeight: 121)
                        .clipped()
                    
                    Rectangle()
                        .frame(width: .infinity, height: 0.5)
                        .foregroundColor(Color("Unselected"))
                        .padding(.top, -7)
                    
                    HStack {
                        Text(product?.namaProduk ?? "")
                            .lineLimit(1)
                            .font(Font.custom("RoundedMplus1c-ExtraBold", size: 12))
                            .foregroundColor(.black)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Image(systemName: "star.fill")
                            .font(.system(size: 10))
                            .foregroundColor(Color("Yellow"))
                            .padding(.trailing, -6)
                        
                        Text("\(product?.rate ?? "")  |  Terjual \(product?.terjual ?? "")")
                            .font(Font.custom("RoundedMplus1c-Regular", size: 10))
                            .foregroundColor(.black)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Text(product?.lokasi ?? "")
                            .font(Font.custom("RoundedMplus1c-Regular", size: 10))
                            .foregroundColor(.black)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Text("Rp\(product?.harga ?? "")")
                            .font(Font.custom("RoundedMplus1c-ExtraBold", size: 12))
                            .foregroundColor(.black)
                        
                        Spacer()
                    }
                    
                }
                .padding(5)
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
