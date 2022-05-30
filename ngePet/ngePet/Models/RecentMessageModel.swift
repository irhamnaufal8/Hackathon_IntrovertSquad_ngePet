//
//  RecentMessageModel.swift
//  ngePet
//
//  Created by Garry on 28/05/22.
//

import SwiftUI
import Firebase

struct RecentMessage: Identifiable {
    var id: String { documentId }
    
    let documentId: String
    let text, nama : String
    let fromId, toId, profileImageUrl: String
//    let timestamp: Timestamp
    let timestamp: Date
    var read, dokter: Bool
    
    init(documentId: String, data: [String: Any]) {
        self.documentId = documentId
        self.text = data["text"] as? String ?? ""
        self.nama = data["nama"] as? String ?? ""
        self.fromId = data["fromId"] as? String ?? ""
        self.toId = data["toId"] as? String ?? ""
        self.profileImageUrl = data["profileImageUrl"] as? String ?? ""
//        self.timestamp = data["timestamp"] as? Timestamp ?? Timestamp(date: Date())
        self.timestamp = data["timestamp"] as? Date ?? Date()
        self.dokter = data["dokter"] as? Bool ?? false
        self.read = data["read"] as? Bool ?? false
    }
}
