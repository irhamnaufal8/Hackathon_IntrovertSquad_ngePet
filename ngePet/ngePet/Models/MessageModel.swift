//
//  MessageModel.swift
//  ngePet
//
//  Created by Garry on 27/05/22.
//

import SwiftUI

struct FirebaseConstants {
    static let fromId = "fromId"
    static let toId = "toId"
    static let text = "text"
    static let timestamp = "timestamp"
}

struct ChatUser: Identifiable {
    var id: String { uid }
    let uid, profileImageUrl, harga, harga2, lokasi, nama, namaProduk, jarak, terjual, umur, rate: String
    let dokter: Bool
    let adopsi: Bool
    
    init(data: [String: Any]) {
        self.uid = data["uid"] as? String ?? ""
        self.profileImageUrl = data["profileImageUrl"] as? String ?? ""
        self.harga = data["harga"] as? String ?? ""
        self.harga2 = data["harga2"] as? String ?? ""
        self.lokasi = data["lokasi"] as? String ?? ""
        self.nama = data["nama"] as? String ?? ""
        self.namaProduk = data["namaProduk"] as? String ?? ""
        self.jarak = data["jarak"] as? String ?? ""
        self.terjual = data["terjual"] as? String ?? ""
        self.umur = data["umur"] as? String ?? ""
        self.rate = data["rate"] as? String ?? ""
        self.dokter = data["dokter"] as? Bool ?? false
        self.adopsi = data["adopsi"] as? Bool ?? false
    }

}

struct ChatMessage: Identifiable {
    var id: String { documentId }
    let documentId: String
    let fromId, toId, text: String
    let dokter, read: Bool
    
    init(documentId: String, data: [String: Any]) {
        self.documentId = documentId
        self.fromId = data[FirebaseConstants.fromId] as? String ?? ""
        self.toId = data[FirebaseConstants.toId] as? String ?? ""
        self.text = data[FirebaseConstants.text] as? String ?? ""
        self.dokter = data["dokter"] as? Bool ?? false
        self.read = data["read"] as? Bool ?? false
    }
}


