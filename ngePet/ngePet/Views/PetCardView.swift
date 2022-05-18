//
//  PetCardView.swift
//  ngePet
//
//  Created by Garry on 17/05/22.
//

import SwiftUI

struct PetCardView: View {
    var hewan: String
    var namaHewan: String
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false){
                VStack {
                    ZStack {
                        Circle()
                            .foregroundColor(Color("Orange"))
                            .frame(width: 98, height: 98)
                        Image("DefaultAvatar")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 73, maxHeight:62)
                    }
                    
                    Text(namaHewan)
                        .font(Font.custom("RoundedMplus1c-ExtraBold", size: 15))
                    
                    VStack(alignment: .leading) {
                        
                    }
                }
                .padding(.top)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("Kartu Hewan")
                            .font(Font.custom("RoundedMplus1c-ExtraBold", size: 18))
                        
                        Spacer()
                        
                        Image(systemName: "square.and.pencil")
                            .font(.system(size: 16, weight: .medium))
                    }
                }
            }
        }
    }
}

struct PetCardView_Previews: PreviewProvider {
    static var previews: some View {
        PetCardView(hewan: "kucing", namaHewan: "Meng")
    }
}
