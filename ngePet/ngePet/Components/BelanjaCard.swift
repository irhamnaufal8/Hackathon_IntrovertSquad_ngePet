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
    @State var url = ""
    var image: String
    
    var body: some View {
        VStack {
            if url != "" {
                AnimatedImage(url: URL(string: url)!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 121)
            }
            else {
                Loader()
                    .frame(width: 173, height: 121)
//                    .background(Color("Unselected"))
            }
            
            Rectangle()
                .frame(width: .infinity, height: 0.5)
                .foregroundColor(Color("Unselected"))
                .padding(.top, -7)
            
            HStack {
                Text("Royal Canin Persian Adult")
                    .lineLimit(1)
                    .font(Font.custom("RoundedMplus1c-ExtraBold", size: 12))
                
                Spacer()
            }
            
            HStack {
                Image(systemName: "star.fill")
                    .font(.system(size: 10))
                    .foregroundColor(Color("Yellow"))
                    .padding(.trailing, -6)
                
                Text("4.9  |  Terjual 10rb")
                    .font(Font.custom("RoundedMplus1c-Regular", size: 10))
                
                Spacer()
            }
            
            HStack {
                Text("Jakarta Barat")
                    .font(Font.custom("RoundedMplus1c-Regular", size: 10))
                
                Spacer()
            }
            
            HStack {
                Text("Rp515.000")
                    .font(Font.custom("RoundedMplus1c-ExtraBold", size: 12))
                
                Spacer()
            }
            
        }
        .padding(5)
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

struct BelanjaCard_Previews: PreviewProvider {
    static var previews: some View {
        BelanjaCard(image: "Wishkas Adult 1.2kg.png")
    }
}
