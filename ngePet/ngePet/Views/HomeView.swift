//
//  HomeView.swift
//  ngePet
//
//  Created by Garry on 16/05/22.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        VStack {
            SearchBar(text: .constant(""))
                .background(Color("Brown"))
                
            
            ScrollView(showsIndicators: false) {
                VStack {
                    
                    // Artikel
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ArticleBadge()
                            ArticleBadge()
                            ArticleBadge()
                        }
                        .padding(.horizontal)
                    }
                    .padding(.vertical)
                    
                    // Status Hewan
                    VStack {
                        HStack {
                            Text("Status hewan")
                                .font(Font.custom("RoundedMplus1c-ExtraBold", size: 15))
                                .padding(.horizontal)
                            
                            Spacer()
                        }
                        
                        HStack {
                            MiniAnimalCard(hewan: "kucing", statusVaksinasi: false, statusMedCheck: true, namaHewan: "Meng")
                            MiniAnimalCard(hewan: "anjing", statusVaksinasi: true, statusMedCheck: false, namaHewan: "Coco")
                            MiniAnimalCard(hewan: "burung", statusVaksinasi: true, statusMedCheck: true, namaHewan: "Toto")
                        }
                    }
                    
                    // Display Petshop
                    VStack {
                        HStack {
                            Text("Belanja kebutuhan hewan, yuk!")
                                .font(Font.custom("RoundedMplus1c-ExtraBold", size: 15))
                                .padding(.horizontal)
                                .padding(.top)
                            
                            Spacer()
                        }
                        
                        HStack {
                            Text("Belanja makanan, obat, pasir, dan masih banyak lagi.")
                                .font(Font.custom("RoundedMplus1c-Regular", size: 12))
                                .foregroundColor(Color("TextDesc"))
                                .padding(.horizontal)
                            
                            Spacer()
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                DisplayPetshopCard(image: "Royal Canin Persian Adult.png")
                                DisplayPetshopCard(image: "Wishkas Adult 1.2kg.png")
                                DisplayPetshopCard(image: "Royal Canin Persian Adult.png")
                                DisplayPetshopCard(image: "Wishkas Adult 1.2kg.png")
                                DisplayPetshopCard(image: "Royal Canin Persian Adult.png")
                                DisplayPetshopCard(image: "Wishkas Adult 1.2kg.png")
                            }
                            .padding(.horizontal)
                        }
                        
                        HStack {
                            Spacer()
                            
                            HStack {
                                Text("Selengkapnya")
                                    .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                                    .foregroundColor(.white)
                                
                                Image(systemName: "arrow.forward.circle.fill")
                                    .font(.system(size: 12))
                                    .foregroundColor(.white)
                            }
                            .padding(5)
                            .padding(.horizontal, 5)
                            .background(Color("Brown"))
                            .cornerRadius(50)
                        }
                        .padding(.horizontal)
                    }
                    
                    // Display Adopsi Hewan
                    VStack {
                        HStack {
                            Text("Adopsi hewan, yuk!")
                                .font(Font.custom("RoundedMplus1c-ExtraBold", size: 15))
                                .padding(.horizontal)
                                .padding(.top)
                            
                            Spacer()
                        }
                        
                        HStack {
                            Text("Ada banyak hewan menggemaskan yang butuh kamu, lho!")
                                .font(Font.custom("RoundedMplus1c-Regular", size: 12))
                                .foregroundColor(Color("TextDesc"))
                                .padding(.horizontal)
                            
                            Spacer()
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                DisplayAdoptCard(image: "Kucing Domestik.png")
                                DisplayAdoptCard(image: "Kucing Domestik.png")
                                DisplayAdoptCard(image: "Kucing Domestik.png")
                                DisplayAdoptCard(image: "Kucing Domestik.png")
                                DisplayAdoptCard(image: "Kucing Domestik.png")
                                DisplayAdoptCard(image: "Kucing Domestik.png")
                            }
                            .padding(.horizontal)
                        }
                        
                        HStack {
                            Spacer()
                            
                            HStack {
                                Text("Selengkapnya")
                                    .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                                    .foregroundColor(.white)
                                
                                Image(systemName: "arrow.forward.circle.fill")
                                    .font(.system(size: 12))
                                    .foregroundColor(.white)
                            }
                            .padding(5)
                            .padding(.horizontal, 5)
                            .background(Color("Brown"))
                            .cornerRadius(50)
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 38)
                    }
                }
            }
            .onTapGesture {
                self.hideKeyboard()
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
    
    private func hideKeyboard() {
            UIApplication.shared.hideKeyboard()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
