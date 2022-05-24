//
//  DoctorView.swift
//  ngePet
//
//  Created by Garry on 16/05/22.
//

import SwiftUI

struct DoctorView: View {
    var body: some View {
        VStack {
            SearchBar(text: .constant(""))
                .background(Color("Brown"))
            
            ScrollView(showsIndicators: false) {
                VStack {
                    
                }
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct DoctorView_Previews: PreviewProvider {
    static var previews: some View {
        DoctorView()
    }
}
