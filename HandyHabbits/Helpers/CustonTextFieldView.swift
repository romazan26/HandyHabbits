//
//  CustonTextFieldView.swift
//  HandyHabbits
//
//  Created by Роман on 11.06.2024.
//

import SwiftUI

struct CustonTextFieldView: View {
    @Binding var text: String
    var placeholder = ""
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundStyle(.white)
                    .opacity(0.6)
            }
            TextField("", text: $text)
        }
    }
}

#Preview {
    CustonTextFieldView(text: .constant(""))
}
