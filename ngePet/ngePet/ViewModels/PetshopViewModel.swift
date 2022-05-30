//
//  PetshopViewModel.swift
//  ngePet
//
//  Created by Garry on 28/05/22.
//

import SwiftUI

class PetshopViewModel: ObservableObject {
    
    @Published var petProduct = [PetProduct]()
    @Published var petAdopt = [PetAdopt]()
    @Published var errorMessage = ""
    
    init() {
        fetchAllPetProduct()
        fetchAllPetAdopt()
    }
    
    private func fetchAllPetProduct() {
        FirebaseManager.shared.firestore.collection("pet_products")
            .getDocuments { documentsSnapshot, error in
                if let error = error {
                    self.errorMessage = "Failed to fetch products: \(error)"
                    print("Failed to fetch products: \(error)")
                    return
                }
                
                documentsSnapshot?.documents.forEach({ snapshot in
                    let data = snapshot.data()
                    self.petProduct.append(.init(data: data))
                })
                
                self.errorMessage = "Fetched products successfully"
            }
    }
    
    private func fetchAllPetAdopt() {
        FirebaseManager.shared.firestore.collection("pet_adopts")
            .getDocuments { documentsSnapshot, error in
                if let error = error {
                    self.errorMessage = "Failed to fetch pet adopts: \(error)"
                    print("Failed to fetch pet adopts: \(error)")
                    return
                }
                
                documentsSnapshot?.documents.forEach({ snapshot in
                    let data = snapshot.data()
                    self.petAdopt.append(.init(data: data))
                })
                
                self.errorMessage = "Fetched pet adopts successfully"
            }
    }
}

