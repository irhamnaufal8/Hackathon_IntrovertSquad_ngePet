//
//  ProductDetailView.swift
//  ngePet
//
//  Created by Garry on 29/05/22.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI

struct ProductDetailView: View {
    let product: PetProduct?
    @State var sameDay = false
    @State var express = false
    @State var regular = false
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
                            
                            if product?.imageUrl != "" {
                                WebImage(url: URL(string: product?.imageUrl ?? ""))
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                                    .clipped()
                            }
                        }
                        
                        Text("Rp\(product?.harga ?? "")")
                            .lineLimit(1)
                            .font(Font.custom("RoundedMplus1c-ExtraBold", size: 24))
                            .padding(.horizontal)
                        
                        Text(product?.namaProduk ?? "")
                            .font(Font.custom("RoundedMplus1c-Medium", size: 18))
                            .padding(.horizontal)
                        
                        HStack {
                            Image(systemName: "star.fill")
                                .font(.system(size: 15))
                                .foregroundColor(Color("Yellow"))
                                .padding(.trailing, -6)
                            
                            Text("\(product?.rate ?? "")  |  Terjual \(product?.terjual ?? "")")
                                .font(Font.custom("RoundedMplus1c-Regular", size: 15))
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        HStack {
                            Image(systemName: "map.fill")
                                .font(.system(size: 15))
                                .foregroundColor(Color("Unselected"))
                                .padding(.trailing, -6)
                            
                            Text(product?.lokasi ?? "")
                                .font(Font.custom("RoundedMplus1c-Regular", size: 15))
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        Divider()
                        
                        VStack(alignment: .leading) {
                            Text("Deskripsi Produk")
                                .font(Font.custom("RoundedMplus1c-Medium", size: 18))
                                .padding(.bottom, 4)
                            
                            Text("Royal Canin Persian 30 adalah produk makanan kering yang dirancang khusus untuk kebutuhan kucing Persia, Himalaya, dan Burma. Royal Canin Persian 30 memiliki bentuk khusus buah almond untuk kucing Persia yang dikenal berbulu indah dan memiliki wajah yang lebar. Royal Canin Persian 30 diformulasikan khusus untuk kesehatan kulit, bulu, dan pencernaan.")
                                .font(Font.custom("RoundedMplus1c-Regular", size: 15))
                        }
                        .padding(.horizontal)
                        .padding(.bottom)
                        
                        Divider()
                            .padding(.horizontal)
                        
                        VStack(alignment: .leading) {
                            Text("Pengiriman")
                                .font(Font.custom("RoundedMplus1c-Medium", size: 18))
                                .padding(.bottom, 4)
                            
                            Button {
                                sameDay.toggle()
                                express = false
                                regular = false
                            } label: {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text("Same Day")
                                            .font(Font.custom("RoundedMplus1c-Medium", size: 15))
                                            .foregroundColor(.black)
                                        
                                        Text("8 - 16 jam")
                                            .font(Font.custom("RoundedMplus1c-Regular", size: 13))
                                            .foregroundColor(.black)
                                    }
                                    
                                    Spacer()
                                    
                                    Image(systemName: sameDay ? "checkmark.square" : "square")
                                        .font(.system(size: 18))
                                        .foregroundColor(Color("Green"))
                                }
                            }
                            .padding(.bottom, 2)
                            
                            Button {
                                express.toggle()
                                sameDay = false
                                regular = false
                            } label: {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text("Express")
                                            .font(Font.custom("RoundedMplus1c-Medium", size: 15))
                                            .foregroundColor(.black)
                                        
                                        Text("1 - 2 hari")
                                            .font(Font.custom("RoundedMplus1c-Regular", size: 13))
                                            .foregroundColor(.black)
                                    }
                                    
                                    Spacer()
                                    
                                    Image(systemName: express ? "checkmark.square" : "square")
                                        .font(.system(size: 18))
                                        .foregroundColor(Color("Green"))
                                }
                            }
                            .padding(.bottom, 2)
                            
                            Button {
                                regular.toggle()
                                sameDay = false
                                express = false
                            } label: {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text("Regular")
                                            .font(Font.custom("RoundedMplus1c-Medium", size: 15))
                                            .foregroundColor(.black)
                                        
                                        Text("2 - 4 hari")
                                            .font(Font.custom("RoundedMplus1c-Regular", size: 13))
                                            .foregroundColor(.black)
                                    }
                                    
                                    Spacer()
                                    
                                    Image(systemName: regular ? "checkmark.square" : "square")
                                        .font(.system(size: 18))
                                        .foregroundColor(Color("Green"))
                                }
                            }
                            .padding(.bottom, 2)

                        }
                        .padding(.horizontal)
                        .padding(.bottom)
                        
                        Divider()
                    }
                    
                    Button {
                        flag.toggle()
                    } label: {
                        Text("Belanja Sekarang")
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
                        Text("Detail Produk")
                            .font(Font.custom("RoundedMplus1c-ExtraBold", size: 18))
                        
                        Spacer()
                    }
                }
            }
            if flag {
                TransaksiSukses(flag: $flag, showTime: time, text: "Transaksi Berhasil")
            }
        }
    }
}
