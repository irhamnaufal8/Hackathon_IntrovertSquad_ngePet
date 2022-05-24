//
//  PetCardView.swift
//  ngePet
//
//  Created by Garry on 17/05/22.
//

import SwiftUI

struct PetCardView: View {
    @Environment(\.editMode) private var editMode
    @State private var disableTextField = true
    @State var jenisRas: String = ""
    @State var jenisKelamin: String = ""
    @State var tanggalLahir: String = ""
    
    var hewan: String
    var namaHewan: String
    
    var body: some View {
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
                
                Text(namaHewan)
                    .font(Font.custom("RoundedMplus1c-ExtraBold", size: 15))
                    .padding(.bottom)
                
                HStack {
                    VStack(alignment: .leading, spacing: 17) {
                        Text("Jenis Ras")
                            .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                        
                        Text("Jenis Kelamin")
                            .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                        
                        Text("Tanggal Lahir/Umur")
                            .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                        
                        Text("Vaksinasi")
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
                    }
                    
                    VStack(alignment: .leading, spacing: 16) {
                        CsutomTextField(
                            placeholder: Text("Persian").foregroundColor(.black),
                            text: $jenisRas
                        )
                        .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                        .lineLimit(1)
                        
                        CsutomTextField(
                            placeholder: Text("Jantan").foregroundColor(.black),
                            text: $jenisKelamin
                        )
                        .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                        .lineLimit(1)
                        
                        HStack {
                            CsutomTextField(
                                placeholder: Text("23 Desember 2020").foregroundColor(.black),
                                text: $tanggalLahir
                            )
                            .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                            .lineLimit(1)
                            
                            Text("/")
                                .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                            
                            Text("1 Tahun 2 Bulan")
                                .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                        }
                        
                        Text("Sudah divaksinasi")
                            .font(Font.custom("RoundedMplus1c-ExtraBold", size: 12))
                            .foregroundColor(Color("Green"))
                    }
                }
            }
            .padding()
            
            // Catatan Medis
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Catatan Medis")
                            .font(Font.custom("RoundedMplus1c-ExtraBold", size: 15))
                        
                        Text("22 April 2022")
                            .font(Font.custom("RoundedMplus1c-Regular", size: 12))
                            .foregroundColor(Color("TextSub"))
                    }
                    
                    Spacer()
                    
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 40))
                        .foregroundColor(Color("Green"))
                }
                .padding()
                
                Line()
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                    .frame(height: 1)
                    .foregroundColor(Color("TextDesc"))
                
                HStack {
                    VStack(alignment: .leading, spacing: 17) {
                        Text("Usia")
                            .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                        
                        Text("Berat Badan")
                            .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                        
                        Text("Temperatur")
                            .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                        
                        Text("Nama Dokter")
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
                    }
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("1 Tahun 3 Bulan")
                            .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                            .lineLimit(1)
                        
                        Text("10,1 kg")
                            .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                            .lineLimit(1)
                        
                        Text("38,5°C")
                            .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                            .lineLimit(1)
                        
                        Text("drh. Ali Abwaba")
                            .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                            .lineLimit(1)
                        
                    }
                }
                .padding()
                
                Line()
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                    .frame(height: 1)
                    .foregroundColor(Color("TextDesc"))
                
                VStack(alignment: .leading) {
                    Text("Catatan")
                        .font(Font.custom("RoundedMplus1c-ExtraBold", size: 12))
                    
                    Text("Diagnosis:")
                        .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                        .foregroundColor(Color("TextSub"))
                    
                    Text("Hewan mengidap penyakit Konjungtivitis & Rhinitis.")
                        .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                        .foregroundColor(Color("TextSub"))
                    
                    Text("Pengobatan:")
                        .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                        .foregroundColor(Color("TextSub"))
                        .padding(.top, 2)
                    
                    Text("1. inj/tolfedine")
                        .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                        .foregroundColor(Color("TextSub"))
                }
                .padding()
            }
            .background(Color("SoftBlue"))
            .cornerRadius(12)
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    Text("Kartu Hewan")
                        .font(Font.custom("RoundedMplus1c-ExtraBold", size: 18))
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "square.and.pencil")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.black)
                    }
                    
                }
            }
        }
    }
}

struct PetCardView_Previews: PreviewProvider {
    static var previews: some View {
        PetCardView(hewan: "kucing", namaHewan: "Meng")
    }
}

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}
