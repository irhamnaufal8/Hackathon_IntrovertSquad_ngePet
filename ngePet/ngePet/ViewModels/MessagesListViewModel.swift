//
//  MessagesListViewModel.swift
//  ngePet
//
//  Created by Garry on 27/05/22.
//

import SwiftUI

class MessagesListViewModel: ObservableObject {
    
    @Published var errorMessage = ""
    @Published var chatUser: ChatUser?
    
    init() {
        fetchCurrentUser()
        fetchRecentMessages()
    }
    
    @Published var recentMessages = [RecentMessage]()
    
    private func fetchRecentMessages() {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
        
        FirebaseManager.shared.firestore
            .collection("recent_messages")
            .document(uid)
            .collection("messages")
            .order(by: "timestamp")
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    self.errorMessage = "Failed to listen for recent messages: \(error)"
                    print(error)
                    return
                }
                
                querySnapshot?.documentChanges.forEach({ change in
                    let docId = change.document.documentID
                    
                    if let index =
                        self.recentMessages.firstIndex(where: { rm in
                        return rm.documentId == docId
                        }) {
                        self.recentMessages.remove(at: index)
                    }
                    
                    self.recentMessages.insert(.init(documentId: docId, data: change.document.data()), at: 0)
                    
//                    self.recentMessages.append()
                })
            }
    }
    
    private func fetchCurrentUser() {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            self.errorMessage = "Could not find firebase uid"
            return
            
        }
        
        
        FirebaseManager.shared.firestore.collection("users").document(uid).getDocument { snapshot, error in
            if let error = error {
                self.errorMessage = "Failed to fetch current user: \(error)"
                print("Failed to fetch current user:", error)
                return
            }
            
            
            
            guard let data = snapshot?.data() else {
                self.errorMessage = "No data found"
                return
                
            }
            
            self.chatUser = .init(data: data)
        }
    }
}
