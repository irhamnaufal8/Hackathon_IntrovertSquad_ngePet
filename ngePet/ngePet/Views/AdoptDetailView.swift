//
//  AdoptDetailView.swift
//  ngePet
//
//  Created by Garry on 29/05/22.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI

struct AdoptDetailView: View {
    let adopt: PetAdopt?
    @State var flag = false
    let time = 3.0
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    VStack(alignment: .leading) {
                        ZStack {
                            Rectangle()
                                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                                .foregroundColor(.white)
                            
                            if adopt?.imageUrl != "" {
                                WebImage(url: URL(string: adopt?.imageUrl ?? ""))
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                                    .clipped()
                            }
                        }
                        
                        Text(adopt?.harga ?? "")
                            .lineLimit(1)
                            .font(Font.custom("RoundedMplus1c-ExtraBold", size: 24))
                            .padding(.horizontal)
                        
                        HStack {
                            Image(systemName: "pawprint.fill")
                                .font(.system(size: 15))
                                .foregroundColor(Color("Unselected"))
                                .padding(.trailing, -6)
                            
                            Text(adopt?.umur ?? "")
                                .font(Font.custom("RoundedMplus1c-Regular", size: 15))
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        Text(adopt?.namaHewan ?? "")
                            .font(Font.custom("RoundedMplus1c-Medium", size: 18))
                            .padding(.horizontal)
                        
                        HStack {
                            Image(systemName: "map.fill")
                                .font(.system(size: 15))
                                .foregroundColor(Color("Brown"))
                                .padding(.trailing, -6)
                            
                            Text("\(adopt?.lokasi ?? "")  |  \(adopt?.jarak ?? "")")
                                .font(Font.custom("RoundedMplus1c-Regular", size: 15))
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        Divider()
                        
                        VStack(alignment: .leading) {
                            Text("Deskripsi Produk")
                                .font(Font.custom("RoundedMplus1c-Medium", size: 18))
                                .padding(.bottom, 4)
                            
                            Text("Kucing Persia adalah kucing ras asing pertama yang diimpor ke Thailand. Kucing Persia telah menjadi salah satu ras kucing paling populer baik lokal maupun internasional. Mereka memiliki kepala bulat yang khas, dengan telinga kecil yang membulat di ujungnya. Kucing Persia ramah dan mudah bergaul, selain itu, wajah mereka yang menggemaskan dan unik juga menjadi alasan yang membuat orang jatuh cinta pada mereka.")
                                .font(Font.custom("RoundedMplus1c-Regular", size: 15))
                        }
                        .padding(.horizontal)
                        .padding(.bottom)
                        
                        Divider()
                    }
                    
                    Button {
                        flag.toggle()
                    } label: {
                        Text("Ajukan Adopsi")
                            .font(Font.custom("RoundedMplus1c-ExtraBold", size: 15))
                            .foregroundColor(.white)
                            .padding(.vertical, 12)
                            .padding(.horizontal, 110)
                            .background(Color("Brown"))
                            .cornerRadius(100)
                    }

                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("Detail Peliharaan")
                            .font(Font.custom("RoundedMplus1c-ExtraBold", size: 18))
                        
                        Spacer()
                    }
                }
            }
            if flag {
                TransaksiSukses(flag: $flag, showTime: time, text: "Adopsi Diajukan")
            }
        }
    }
}
