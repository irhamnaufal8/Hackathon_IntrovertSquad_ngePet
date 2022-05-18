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
    @State var url = ""
    var image: String
    
    var body: some View {
        VStack {
            if url != "" {
                AnimatedImage(url: URL(string: url)!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(-20)
                    .frame(maxHeight: 92)
            }
            else {
                Loader()
                    .frame(width: 132, height: 92)
                    .background(Color("Unselected"))
            }
            
            Rectangle()
                .frame(width: .infinity, height: 0.5)
                .foregroundColor(Color("Unselected"))
                .padding(.top, -7)
            
            HStack {
                Text("Kucing Kampung")
                    .lineLimit(1)
                    .font(Font.custom("RoundedMplus1c-ExtraBold", size: 12))
                
                Spacer()
            }
            
            HStack {
                Text("Jakart Selatan")
                    .font(Font.custom("RoundedMplus1c-Regular", size: 10))
                
                Spacer()
            }
            
            HStack {
                Text("Gratis")
                    .font(Font.custom("RoundedMplus1c-ExtraBold", size: 12))
                
                Spacer()
            }
            
        }
        .padding(5)
        .frame(width: 132, height: 170)
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

struct DisplayAdoptCard_Previews: PreviewProvider {
    static var previews: some View {
        DisplayAdoptCard(image: "Kucing Domestik.png")
    }
}
