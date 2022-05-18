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
    @State var url = ""
    var artikelNumber = 1
    var body: some View {
        VStack {
            if url != "" {
                AnimatedImage(url: URL(string: url)!)
                    .frame(width: 320, height: 134)
                    .cornerRadius(20)
            }
            else {
                Loader()
                    .frame(width: 320, height: 134)
                    .background(Color("Unselected"))
                    .cornerRadius(30)
            }
        }
        .onAppear {
            let storage = Storage.storage().reference()
            storage.child("artikel\(artikelNumber).png").downloadURL { (url, err) in
                if err != nil {
                    print((err?.localizedDescription)!)
                    return
                }
                
                self.url = "\(url!)"
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

struct ArticleBadge_Previews: PreviewProvider {
    static var previews: some View {
        ArticleBadge()
    }
}
