//
//  ArticleViewModel.swift
//  ngePet
//
//  Created by Garry on 28/05/22.
//

import SwiftUI

class ArticleViewModel: ObservableObject {
    
    @Published var articles = [ArticleContent]()
    @Published var errorMessage = ""
    
    init() {
        fetchAllArticles()
    }
    
    private func fetchAllArticles() {
        FirebaseManager.shared.firestore.collection("articles")
            .getDocuments { documentsSnapshot, error in
                if let error = error {
                    self.errorMessage = "Failed to fetch articles: \(error)"
                    print("Failed to fetch articles: \(error)")
                    return
                }
                
                documentsSnapshot?.documents.forEach({ snapshot in
                    let data = snapshot.data()
                    self.articles.append(.init(data: data))
                })
                
                self.errorMessage = "Fetched articles successfully"
            }
    }
}

