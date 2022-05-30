//
//  ArticleBadge.swift
//  ngePet
//
//  Created by Garry on 16/05/22.
//

import SwiftUI
import SDWebImageSwiftUI
import Firebase

struct ArticleBadge: View {
    let article: ArticleContent?
    
    var body: some View {
        ZStack {
            Loader()
                .frame(width: 320, height: 134)
                .background(Color("SoftPurple"))
                .cornerRadius(30)
            
            if article?.imageUrl != "" {
                WebImage(url: URL(string: article?.imageUrl ?? ""))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 320, height: 134)
                    .cornerRadius(20)
            }
        }
    }
}

struct Loader: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<Loader>) -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.startAnimating()
        return indicator
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<Loader>) {
        
    }
}
