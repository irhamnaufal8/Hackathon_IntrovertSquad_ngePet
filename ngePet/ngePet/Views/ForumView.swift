//
//  ForumView.swift
//  ngePet
//
//  Created by Garry on 16/05/22.
//

import SwiftUI

struct ForumView: View {
    var body: some View {
        VStack {
            SearchBar(text: .constant(""))
                .background(Color("Brown"))
            
            ScrollView(showsIndicators: false) {
                VStack {
                    
                }
            }
        }
    }
}

struct ForumView_Previews: PreviewProvider {
    static var previews: some View {
        ForumView()
    }
}
