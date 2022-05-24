//
//  PostingForumView.swift
//  ngePet
//
//  Created by Garry on 24/05/22.
//

import SwiftUI

struct PostingForumView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var isEditing = false
    @State var text: String = ""
    var placeholder: String = "Tanyakan pada forum..."
    
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
                    Text("Unggah")
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
                .padding(.vertical, 8)
            
            ScrollView(showsIndicators: false) {
                VStack {
                    ZStack {
                        TextEditor(text: $text)
                            .frame(height: UIScreen.main.bounds.height/3)
                            .foregroundColor(.black)
                            .font(Font.custom("RoundedMplus1c-Regular", size: 13))
                            .padding(.horizontal)
                            .onTapGesture {
                                self.isEditing = true
                        }
                        
                        Text(isEditing ? "" : placeholder)
                            .font(Font.custom("RoundedMplus1c-Regular", size: 13))
                            .foregroundColor(Color("Unselected"))
                            .allowsHitTesting(false)
                            .position(x: 86, y: 16)
                    }
                }
            }
        }
    }
}

struct PostingForumView_Previews: PreviewProvider {
    static var previews: some View {
        PostingForumView()
    }
}
