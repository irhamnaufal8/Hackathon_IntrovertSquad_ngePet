//
//  AddPetView.swift
//  ngePet
//
//  Created by Garry on 25/05/22.
//

import SwiftUI

struct AddPetView: View {
    @Environment(\.editMode) private var editMode
    @Environment(\.presentationMode) var presentationMode
    @State private var disableTextField = true
    @State var jenisRas: String = ""
    @State var jenisKelamin: String = ""
    @State var tanggalLahir: String = ""
    @State var namaHewan: String = ""
    @State var hewan: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(Color("TextDesc"))
                        .font(.system(size: 20))
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("Tambah")
                        .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                        .foregroundColor(.white)
                        .padding(.vertical, 9)
                        .padding(.horizontal)
                        .background(Color("Brown"))
                        .cornerRadius(100)
                    
                }
                
            }
            .padding(.horizontal)
            
            Rectangle()
                .foregroundColor(Color("Unselected"))
                .frame(width: .infinity, height: 0.5)
                .padding(.top, 8)
            
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
                    .padding()
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 17) {
                            Text("Nama Hewan")
                                .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                            
                            Text("Jenis Hewan")
                                .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                            
                            Text("Jenis Ras")
                                .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                            
                            Text("Jenis Kelamin")
                                .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                            
                            Text("Tanggal Lahir/Umur")
                                .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                        }
                        
                        VStack(alignment: .leading, spacing: 17) {
                            Text(":")
                                .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                            
                            Text(":")
                                .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                            
                            Text(":")
                                .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                            
                            Text(":")
                                .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                            
                            Text(":")
                                .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                        }
                        
                        VStack(alignment: .leading, spacing: 16) {
                            CsutomTextField(
                                placeholder: Text("Nama Hewan").foregroundColor(Color("TextDesc")),
                                text: $namaHewan
                            )
                            .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                            .lineLimit(1)
                            
                            CsutomTextField(
                                placeholder: Text("Jenis Hewan").foregroundColor(Color("TextDesc")),
                                text: $hewan
                            )
                            .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                            .lineLimit(1)
                            
                            CsutomTextField(
                                placeholder: Text("Jenis Ras").foregroundColor(Color("TextDesc")),
                                text: $jenisRas
                            )
                            .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                            .lineLimit(1)
                            
                            CsutomTextField(
                                placeholder: Text("Jantan").foregroundColor(Color("TextDesc")),
                                text: $jenisKelamin
                            )
                            .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                            .lineLimit(1)
                            
                            HStack {
                                CsutomTextField(
                                    placeholder: Text("23 Desember 2020").foregroundColor(Color("TextDesc")),
                                    text: $tanggalLahir
                                )
                                .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                                .lineLimit(1)
                                
                                Text("/")
                                    .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                                
                                Text("1 Tahun 2 Bulan")
                                    .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                            }

                        }
                    }
                }
                .padding()
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("Kartu Hewan")
                            .font(Font.custom("RoundedMplus1c-ExtraBold", size: 18))
                        
                        Spacer()
                    }
                }
        }
        }
    }
}

struct AddPetView_Previews: PreviewProvider {
    static var previews: some View {
        AddPetView()
    }
}
