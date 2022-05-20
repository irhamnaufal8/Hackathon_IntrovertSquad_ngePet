//
//  Tes.swift
//  ngePet
//
//  Created by Garry on 18/05/22.
//

import SwiftUI

struct CsutomTextField: View {
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty { placeholder }
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
}

struct TesTes: View {
    @State var text = ""

    var body: some View {
        CsutomTextField(
            placeholder: Text("placeholder").foregroundColor(.red),
            text: $text
        )
    }
}

struct TesTes_Previews: PreviewProvider {
    static var previews: some View {
        TesTes()
    }
}
