//
//  DoctorView.swift
//  ngePet
//
//  Created by Garry on 16/05/22.
//

import SwiftUI

struct DoctorView: View {
    @State var history = false
    
    var body: some View {
        VStack {
            SearchBar(text: .constant(""))
                .background(Color("Brown"))
            
            Picker(selection: $history, label: Text("Picker")) {
                Text("Cari Dokter")
                    .tag(false)
                    .font(Font.custom("RoundedMplus1c-Medium", size: 15))
                
                Text("Histori Transaksi")
                    .font(Font.custom("RoundedMplus1c-Medium", size: 15))
                    .tag(true)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
            
            VStack {
                if history == false {
                    DoctorListView()
                } else {
                    TransactionHistoryView()
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
