//
//  AdopsiView.swift
//  ngePet
//
//  Created by Garry on 26/05/22.
//

import SwiftUI

struct AdopsiView: View {
    let columns = [
            GridItem(.adaptive(minimum: 173))
        ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns, content: {
                ForEach(0 ..< 10) { i in
                    AdopsiCard(image: "Kucing Domestik.png")
                }
            })
        }
        .padding(.horizontal)
    }
}

struct AdopsiView_Previews: PreviewProvider {
    static var previews: some View {
        AdopsiView()
    }
}
