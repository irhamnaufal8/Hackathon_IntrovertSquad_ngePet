//
//  BelanjaView.swift
//  ngePet
//
//  Created by Garry on 26/05/22.
//

import SwiftUI

struct BelanjaView: View {
    
    @ObservedObject var vm = PetshopViewModel()
    
    let columns = [
            GridItem(.adaptive(minimum: 173))
        ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns, content: {
                ForEach(vm.petProduct) { product in
                    NavigationLink {
                        ProductDetailView(product: product)
                    } label: {
                        BelanjaCard(product: product)
                    }
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
