//
//  AdopsiView.swift
//  ngePet
//
//  Created by Garry on 26/05/22.
//

import SwiftUI

struct AdopsiView: View {
    @ObservedObject var vm = PetshopViewModel()
    
    let columns = [
            GridItem(.adaptive(minimum: 173))
        ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns, content: {
                ForEach(vm.petAdopt) { adopt in
                    NavigationLink {
                        AdoptDetailView(adopt: adopt)
                    } label: {
                        AdopsiCard(adopt: adopt)
                    }
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
