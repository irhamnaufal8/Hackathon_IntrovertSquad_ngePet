//
//  SearchBar.swift
//  ngePet
//
//  Created by Garry on 16/05/22.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @State private var isEditing = false
    
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .font(.system(.title2))
                        .foregroundColor(Color("TextSub"))
                    
                    TextField("Cari makanan, obat, hewan, dokter, dan lain-lain", text: $text)
                        .lineLimit(1)
                        .font(Font.custom("RoundedMplus1c-Regular", size: 15))
                        .padding(.horizontal, 4)
                        .onTapGesture {
                            self.isEditing = true
                    }
                }
                .padding()
                .frame(maxWidth: 318, maxHeight: 40)
                .background(.white)
                .cornerRadius(30)
                .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color("Unselected"), lineWidth: 0.5)
                    )
                
                if isEditing {
                    Button("", action: {
                        self.isEditing = false
                        self.text = ""
                    })
                }
                
                NavigationLink {
                    MessagesListView()
                } label: {
                    Image(systemName: "message.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                }
            }
            .padding()
            .background(Color("Brown"))
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}

extension UIApplication {
    func hideKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
