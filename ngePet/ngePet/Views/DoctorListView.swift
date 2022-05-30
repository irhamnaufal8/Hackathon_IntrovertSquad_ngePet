//
//  DoctorListView.swift
//  ngePet
//
//  Created by Garry on 27/05/22.
//

import SwiftUI
import SDWebImageSwiftUI
import Firebase

struct DoctorListView: View {
    
    @ObservedObject var vm = CreateNewMessageViewModel()
    
    var body: some View {
        ScrollView {
            ForEach(vm.users) { user in
                if user.dokter == true {
                    NavigationLink {
                        DoctorDetailView(user: user)
                    } label: {
                        DoctorCard(user: user)
                    }

                    Divider()
                }
            }
        }
    }
}

struct DoctorListView_Previews: PreviewProvider {
    static var previews: some View {
        DoctorListView()
    }
}
