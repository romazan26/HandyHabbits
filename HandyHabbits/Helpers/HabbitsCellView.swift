//
//  HabbitsCellView.swift
//  HandyHabbits
//
//  Created by Роман on 28.05.2024.
//

import SwiftUI

struct HabbitsCellView: View {
    let habbit: Habbit

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
                Text("Delete").foregroundStyle(.blue.opacity(0.6))
            }
            .padding()
            .foregroundStyle(.white)
            
            //MARK: - Tast List
            if let tasks = habbit.tasks?.allObjects as? [Task] {
                ForEach(tasks) { task in
                    HStack{
                        if task.completed {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundStyle(.bluButton)
                                .frame(width: 19)
                        }else{
                            Circle().frame(width: 19).foregroundStyle(.gray.opacity(0.5))
                        }
                        Text("\(task.name ?? "")")
                            .lineLimit(1)
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(.gray)
                            .font(.system(size: 13))
                    }.padding(.horizontal)
                }
            }
            Spacer()
            
        }
        .frame(width: 356, height: 169)
        .background {
            Color(.cell).cornerRadius(13)
        }
    }
}

//#Preview {
//    HabbitsCellView(habbit: Habbit())
//}
