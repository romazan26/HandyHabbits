//
//  BluButtonView.swift
//  HandyHabbits
//
//  Created by Роман on 23.05.2024.
//

import SwiftUI

struct BluButtonView: View {
    var text = ""
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 35)
                .foregroundStyle(.bluButton)
            Text(text)
                .foregroundStyle(.white)
                .font(.system(size: 18, weight: .bold))
        }.frame(width: 356, height: 67)
    }
}

#Preview {
    BluButtonView()
}
