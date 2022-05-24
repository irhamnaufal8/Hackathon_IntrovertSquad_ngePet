//
//  ProfileView.swift
//  ngePet
//
//  Created by Garry on 16/05/22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
            VStack {
                HStack {
                    Image(systemName: "person.circle.fill")
                        .font(.system(size: 40))
                        .foregroundColor(Color("Blue"))
                    
                    Spacer()
                    
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 32))
                        .foregroundColor(Color("Brown"))
                }
                .padding()
                
                ScrollView(showsIndicators: false) {
                    VStack {
                        HStack {
                            Text("Peliharaanku")
                                .font(Font.custom("RoundedMplus1c-ExtraBold", size: 22))
                                .padding(.horizontal)
                            
                            Spacer()
                        }
                        
                        NavigationLink {
                            PetCardView(hewan: "", namaHewan: "Meng")
                        } label: {
                            AnimalCard(hewan: "kucing", namaHewan: "Meng")
                        }
                        
                        AnimalCard(hewan: "anjing", namaHewan: "Coco")
                        AnimalCard(hewan: "burung", namaHewan: "Toto")
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .accentColor(.black)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
