//
//  HabbitsCellView.swift
//  HandyHabbits
//
//  Created by Роман on 28.05.2024.
//

import SwiftUI

struct HabbitsCellView: View {
    let habbit: Habbit
    
    
    @StateObject var viewModel: ViewModel
    @State var completed = false

    var body: some View {
        VStack(alignment: .leading) {
           
            //MARK: - Title
            HStack(spacing: 20) {
                
                Text("\(habbit.name ?? "")")
                    .font(.system(size: 15, weight: .bold))
                    
                ZStack{
                    Color.colorApp
                    Text(Dateformatter(date: habbit.date ?? Date.now))
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
            
            //MARK: - Task List
            if let tasks = habbit.tasks?.allObjects as? [Task] {
                ForEach(tasks) { task in
                    HStack{
                        if task.completed {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundStyle(.bluButton)
                                .frame(width: 19)
                        }else{
                            Circle().frame(width: 19).foregroundStyle(.gray.opacity(0.5))
                                .onTapGesture {
                                    viewModel.updataTask(with: task.id, completed: true)
                                    viewModel.checkingForCompletedTasks(orHabbit: habbit)
                                    completed = viewModel.isComleted
                                }
                        }
                        
                        //MARK: - Name of task
                        Text("\(task.name ?? "")")
                            .lineLimit(1)
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(.gray)
                            .font(.system(size: 13))
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 3)
                }
            }
            Spacer()
            
        }
        .opacity(completed ? 0.4 : 1)
        .onAppear(perform: {
            viewModel.checkingForCompletedTasks(orHabbit: habbit)
            completed = viewModel.isComleted
        })
        .frame(width: 356, height: 169)
        .background {
            Color(.cell).cornerRadius(13)
        }
        
    }
    
//MARK: - Dateformatter
    private func Dateformatter(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d.M.yyyy"
        return dateFormatter.string(from: date)
    }
}

//#Preview {
//    HabbitsCellView(habbit: Habbit())
//}
