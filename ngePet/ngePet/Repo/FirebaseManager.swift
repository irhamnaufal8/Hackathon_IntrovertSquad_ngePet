//
//  FirebaseManager.swift
//  ngePet
//
//  Created by Garry on 27/05/22.
//

import SwiftUI
import Firebase

class FirebaseManager: NSObject {
    let auth: Auth
    let storage: Storage
    let firestore: Firestore
    
    static let shared = FirebaseManager()

    override init() {
        
        self.auth = Auth.auth()
        self.storage = Storage.storage()
        self.firestore = Firestore.firestore()
        
        super.init()
    }
}
