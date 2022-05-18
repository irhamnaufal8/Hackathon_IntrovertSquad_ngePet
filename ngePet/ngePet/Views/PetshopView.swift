//
//  PetshopView.swift
//  ngePet
//
//  Created by Garry on 16/05/22.
//

import SwiftUI

struct PetshopView: View {
    var body: some View {
        VStack {
            SearchBar(text: .constant(""))
                .background(Color("Brown"))
            
            ScrollView(showsIndicators: false) {
                VStack {
                    
                }
            }
        }
    }
}

struct PetshopView_Previews: PreviewProvider {
    static var previews: some View {
        PetshopView()
    }
}
