//
//  ForumView.swift
//  ngePet
//
//  Created by Garry on 16/05/22.
//

import SwiftUI

struct ForumView: View {
    @State var showSheet: Bool = false
    var body: some View {
        VStack {
            SearchBar(text: .constant(""))
                .background(Color("Brown"))
            ZStack {
                ScrollView(showsIndicators: false) {
                    VStack {
                        ForumCard()
                        ForumCard()
                        ForumCard()
                        ForumCard()
                    }
                }
                
                Button {
                    showSheet.toggle()
                } label: {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                        
                        Text("Unggah")
                            .font(Font.custom("RoundedMplus1c-Medium", size: 12))
                            .foregroundColor(.white)
                    }
                    .padding(9)
                    .background(Color("Brown"))
                    .cornerRadius(100)
                    .shadow(color: Color("Unselected"), radius: 20, y: 4)
                }
                .fullScreenCover(isPresented: $showSheet) {
                    PostingForumView()
                }
                .position(x: UIScreen.main.bounds.maxX * 15/18, y: UIScreen.main.bounds.maxY * 14/20)
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct ForumView_Previews: PreviewProvider {
    static var previews: some View {
        ForumView()
    }
}
