//
//  MiniAnimalCard.swift
//  ngePet
//
//  Created by Garry on 17/05/22.
//

import SwiftUI

struct MiniAnimalCard: View {
    var hewan: String
    var statusVaksinasi: Bool
    var statusMedCheck: Bool
    var namaHewan: String
    
    var body: some View {
        ZStack {
            if hewan == "kucing" {
                Rectangle()
                    .frame(width: 114, height: 125)
                    .foregroundColor(Color("SoftBrown"))
                    .cornerRadius(12)
            } else if hewan == "anjing" {
                Rectangle()
                    .frame(width: 114, height: 125)
                    .foregroundColor(Color("SoftBlue"))
                    .cornerRadius(12)
            } else {
                Rectangle()
                    .frame(width: 114, height: 125)
                    .foregroundColor(Color("SoftGreen"))
                    .cornerRadius(12)
            }
            
            VStack {
                ZStack {
                    Circle()
                        .foregroundColor(Color("Orange"))
                        .frame(maxWidth: 40, maxHeight: 40)
                    Image("DefaultAvatar")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 29.8, maxHeight:25.31)
                }
                
                Text(namaHewan)
                    .lineLimit(1)
                    .font(Font.custom("RoundedMplus1c-ExtraBold", size: 12))
                
                HStack {
                    Text("Vaksinasi")
                        .lineLimit(1)
                        .font(Font.custom("RoundedMplus1c-Regular", size: 10))
                    
                    Spacer()
                    
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 10))
                        .foregroundColor(statusVaksinasi == true ? Color("Green") : Color("Red"))
                }
                
                HStack {
                    Text("Medical Check-Up")
                        .lineLimit(1)
                        .font(Font.custom("RoundedMplus1c-Regular", size: 10))
                    
                    Spacer()
                    
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 10))
                        .foregroundColor(statusMedCheck == true ? Color("Green") : Color("Red"))
                }
                
                HStack {
                    Text("Konsultasi")
                        .lineLimit(1)
                        .font(Font.custom("RoundedMplus1c-Regular", size: 10))
                    
                    Spacer()
                    
                    Image(systemName: "arrow.forward.circle.fill")
                        .font(.system(size: 10))
                        .foregroundColor(Color("Red"))
                }
            }
            .padding(5)
            .frame(width: 114, height: 125)
        }
        
    }
}

struct MiniAnimalCard_Previews: PreviewProvider {
    static var previews: some View {
        MiniAnimalCard(hewan: "kucing", statusVaksinasi: false, statusMedCheck: true, namaHewan: "Meng")
    }
}
