//
//  CreateHabbitView.swift
//  HandyHabbits
//
//  Created by Роман on 28.05.2024.
//

import SwiftUI

struct CreateHabbitView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var vm: ViewModel
    @State private var tasktextField = 1
    var body: some View {
        ZStack {
            //MARK: - Background
            Color(.colorApp).ignoresSafeArea()
            VStack {
                //MARK: - Toolbar
                HStack(spacing: 20){
                    Button(action: {dismiss()}, label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .frame(width: 10, height: 14)
                            .foregroundStyle(.white)
                    })
                    Text("New habbit")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundStyle(.white)
                        
                    Spacer()
                    ZStack{
                        Color.cell
                        Text("19.05.24  ")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundStyle(.white)
                            .padding()
                    }
                    .frame(width: 100, height: 35)
                    .cornerRadius(8)
                }.padding()
                
                //MARK: - Name Habbit
                TextField("Habbit title", text: $vm.simpleHabbitName)
                    .background(content: {
                        Color.cell
                            .frame(width: 356, height: 63)
                            .cornerRadius(13)
                            
                    })
                    .foregroundStyle(.white)
                    .padding()
                    .frame(width: 356, height: 63)
                
                //MARK: - task group
                if tasktextField > 0 {
                    TextField("Task 1", text: $vm.simpleTaskName1)
                        .background(content: {
                            Color.cell
                                .frame(width: 356, height: 63)
                                .cornerRadius(13)
                                
                        })
                        .foregroundStyle(.white)
                        .padding()
                        .frame(width: 356, height: 63)
                }
                if tasktextField > 1 {
                    TextField("Task 2", text: $vm.simpleTaskName2)
                        .background(content: {
                            Color.cell
                                .frame(width: 356, height: 63)
                                .cornerRadius(13)
                                
                        })
                        .foregroundStyle(.white)
                        .padding()
                        .frame(width: 356, height: 63)
                }
                if tasktextField > 2 {
                    TextField("Task 3", text: $vm.simpleTaskName3)
                        .background(content: {
                            Color.cell
                                .frame(width: 356, height: 63)
                                .cornerRadius(13)
                                
                        })
                        .foregroundStyle(.white)
                        .padding()
                        .frame(width: 356, height: 63)
                }
                
                //MARK: - oneMore Task button
                if tasktextField < 3{
                    Button(action: {
                        if tasktextField < 3{
                            tasktextField += 1
                        }
                    }, label: {Text("+").foregroundStyle(.white)})
                    .frame(width: 356, height: 63)
                    .overlay {
                        RoundedRectangle(cornerRadius: 11)
                            .stroke(.white.opacity(0.3), lineWidth: 2)
                    }
                }
                Spacer()
                Button(action: {
                    
                    vm.addHabbit()
                    vm.addTask(simpleTask: vm.simpleTaskName1)
                    vm.addTask(simpleTask: vm.simpleTaskName2)
                    vm.addTask(simpleTask: vm.simpleTaskName3)
                }, label: {
                    BluButtonView(text: "Create")
                })
               
            }
        }
    }
}

#Preview {
    CreateHabbitView( vm: ViewModel())
}
