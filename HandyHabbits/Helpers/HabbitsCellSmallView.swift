//
//  HabbitsCellSmallView.swift
//  HandyHabbits
//
//  Created by Роман on 29.05.2024.
//

import SwiftUI

struct HabbitsCellSmallView: View {
    let habbit: Habbit
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            //MARK: - Title
            HStack(spacing: 20) {
                Text("\(habbit.name ?? "")")
                    .font(.system(size: 15, weight: .bold))
                ZStack{
                    Color.colorApp
                    Text("\(habbit.date ?? Date.now)")
                        .font(.system(size: 14, weight: .bold))
                }
                .frame(width: 84, height: 30)
                .cornerRadius(8)
                
                Spacer()
                
                //MARK: - Delete button
                Button(action: {viewModel.deleteHabbit(with: habbit.id)}, label: {
                    Text("Delete").foregroundStyle(.blue.opacity(0.6))
                })
                
            }
            .padding()
            .foregroundStyle(.white)
            
        }        
        .frame(width: 356, height: 50)
        .background {
            Color(.cell).cornerRadius(13)
        }
    }
}

//#Preview {
//    HabbitsCellSmallView(habbit: Habbit(), viewModel: ViewModel())
//}
