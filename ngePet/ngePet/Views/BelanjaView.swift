//
//  BelanjaView.swift
//  ngePet
//
//  Created by Garry on 26/05/22.
//

import SwiftUI

struct BelanjaView: View {
    
    let columns = [
            GridItem(.adaptive(minimum: 173))
        ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns, content: {
                ForEach(0 ..< 10) { i in
                    BelanjaCard(image: "Wishkas Adult 1.2kg.png")
                }
            })
        }
        .padding(.horizontal)
    }
}

struct BelanjaView_Previews: PreviewProvider {
    static var previews: some View {
        BelanjaView()
    }
}
