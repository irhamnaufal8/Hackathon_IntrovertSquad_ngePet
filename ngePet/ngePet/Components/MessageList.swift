//
//  MessageList.swift
//  ngePet
//
//  Created by Garry on 25/05/22.
//

import SwiftUI

struct MessageList: View {
    @State private var read = false
    @State private var dokter = true
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Image(systemName: "person.circle.fill")
                        .font(.system(size: 70))
                        .foregroundColor(Color("Unselected"))
                    
                    Image(systemName: dokter ? "stethoscope.circle.fill" : "bag.circle.fill")
                        .padding(-2)
                        .foregroundColor(dokter ? Color("Cyan") : Color("Red"))
                        .font(.system(size: 20))
                        .background(.white)
                        .cornerRadius(100)
                        .padding(.top, -35)
                        .padding(.leading, 4)
                        .padding(.bottom, -16)
                }
                
                VStack {
                    HStack {
                        Text("drh. Ali Abwaba")
                            .font(Font.custom("RoundedMplus1c-Bold", size: 15))
                            .foregroundColor(read ? Color("TextSub") : .black)
                            .lineLimit(1)
                        
                        Spacer()
                        
                        Text("08.12")
                            .font(Font.custom("RoundedMplus1c-Medium", size: 10))
                    }
                    .padding(.bottom, -3)
                    
                    HStack {
                        Text("Kami sarankan ibu untuk memberikan penanganan berupa")
                            .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                            .foregroundColor(read ? Color("TextSub") : .black)
                            .lineLimit(1)
                        
                        Spacer()
                        
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(read ? .white : Color("Blue"))
                    }
                    .padding(.top, -3)
                }
            }
        }
        .padding(.horizontal)
        .onTapGesture {
            read = true
        }
    }
}

struct MessageList_Previews: PreviewProvider {
    static var previews: some View {
        MessageList()
    }
}
