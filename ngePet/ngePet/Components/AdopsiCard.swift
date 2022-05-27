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
    
    @State var url = ""
    var image: String
    
    var body: some View {
        VStack {
            if url != "" {
                AnimatedImage(url: URL(string: url)!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: .infinity)
            }
            else {
                Loader()
                    .frame(width: 173, height: 121)
            }
            
            Rectangle()
                .frame(width: .infinity, height: 0.5)
                .foregroundColor(Color("Unselected"))
                .padding(.top, -7)
            
            VStack {
                HStack {
                    Text("Kucing Domestik")
                        .lineLimit(1)
                        .font(Font.custom("RoundedMplus1c-ExtraBold", size: 12))
                    
                    Spacer()
                }
                
                HStack {
                    Image(systemName: "pawprint.fill")
                        .font(.system(size: 10))
                        .foregroundColor(Color("TextDesc"))
                        .padding(.trailing, -6)
                    
                    Text("1 Tahun")
                        .font(Font.custom("RoundedMplus1c-Regular", size: 10))
                        .foregroundColor(Color("TextDesc"))
                    
                    Spacer()
                }
                
                HStack {
                    Text("Bekasi  |  10 km")
                        .font(Font.custom("RoundedMplus1c-Regular", size: 10))
                        .foregroundColor(Color("TextSub"))
                    
                    Spacer()
                }
                
                HStack {
                    Text("Gratis")
                        .font(Font.custom("RoundedMplus1c-ExtraBold", size: 12))
                        .padding(.bottom)
                    
                    Spacer()
                }
            }
            .padding(.horizontal)
            
        }
        .frame(width: 173, height: 223)
        .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color("Unselected"), lineWidth: 0.5)
            )
        .onAppear {
            let storage = Storage.storage().reference()
            storage.child(image).downloadURL { (url, err) in
                if err != nil {
                    print((err?.localizedDescription)!)
                    return
                }
                
                self.url = "\(url!)"
            }
        }
    }
}

struct AdopsiCard_Previews: PreviewProvider {
    static var previews: some View {
        AdopsiCard(image: "Kucing Domestik.png")
    }
}
