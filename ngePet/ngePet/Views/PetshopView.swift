//
//  PetshopView.swift
//  ngePet
//
//  Created by Garry on 16/05/22.
//

import SwiftUI

struct PetshopView: View {
    
    @State var adopt = false
    
    var body: some View {
        VStack {
            SearchBar(text: .constant(""))
                .background(Color("Brown"))
            
            Picker(selection: $adopt, label: Text("Picker")) {
                Text("Belanja")
                    .tag(false)
                    .font(Font.custom("RoundedMplus1c-Medium", size: 15))
                
                Text("Adopsi")
                    .font(Font.custom("RoundedMplus1c-Medium", size: 15))
                    .tag(true)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
            
            VStack {
                if adopt == false {
                    BelanjaView()
                } else {
                    AdopsiView()
                }
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct PetshopView_Previews: PreviewProvider {
    static var previews: some View {
        PetshopView()
    }
}
