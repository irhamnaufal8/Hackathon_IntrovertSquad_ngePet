//
//  PetshopModel.swift
//  ngePet
//
//  Created by Garry on 28/05/22.
//

import SwiftUI

struct PetProduct: Identifiable {
    var id: String { uid }
    let uid, namaProduk, imageUrl, terjual, rate, lokasi, harga: String
    
    init(data: [String: Any]) {
        self.uid = data["uid"] as? String ?? ""
        self.namaProduk = data["namaProduk"] as? String ?? ""
        self.terjual = data["terjual"] as? String ?? ""
        self.rate = data["rate"] as? String ?? ""
        self.lokasi = data["lokasi"] as? String ?? ""
        self.harga = data["harga"] as? String ?? ""
        self.imageUrl = data["imageUrl"] as? String ?? ""
    }
}

struct PetAdopt: Identifiable {
    var id: String { uid }
    let uid, namaHewan, imageUrl, umur, jarak, lokasi, harga: String
    
    init(data: [String: Any]) {
        self.uid = data["uid"] as? String ?? ""
        self.namaHewan = data["namaHewan"] as? String ?? ""
        self.umur = data["umur"] as? String ?? ""
        self.jarak = data["jarak"] as? String ?? ""
        self.lokasi = data["lokasi"] as? String ?? ""
        self.harga = data["harga"] as? String ?? ""
        self.imageUrl = data["imageUrl"] as? String ?? ""
    }
}

