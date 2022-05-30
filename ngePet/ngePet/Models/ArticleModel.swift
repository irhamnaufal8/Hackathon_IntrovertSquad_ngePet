//
//  ArticleModel.swift
//  ngePet
//
//  Created by Garry on 28/05/22.
//

import SwiftUI

struct ArticleContent: Identifiable {
    var id: String { uid }
    let uid, link, imageUrl: String
    
    init(data: [String: Any]) {
        self.uid = data["uid"] as? String ?? ""
        self.link = data["link"] as? String ?? ""
        self.imageUrl = data["imageUrl"] as? String ?? ""
    }
}
