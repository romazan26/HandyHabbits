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
    @FocusState private var keyboardIsFocused: Bool
    
    var body: some View {
        ZStack {
            //MARK: - Background
            Color(.colorApp).ignoresSafeArea()
                .onTapGesture {
                    keyboardIsFocused = false
                }
            VStack {
                //MARK: - Toolbar
                HStack(spacing: 20){
                    Button(action: {
                        dismiss()
                    }, label: {
                        ZStack {
                            Circle().foregroundStyle(.colorApp)
                                .frame(width: 20, height: 28)
                            Image(systemName: "chevron.left")
                                .resizable()
                                .frame(width: 13, height: 20)
                                .foregroundStyle(.white)
                                .font(.system(.headline))
                        }
                            
                            
                    })
                    
                    Text("New habbit")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundStyle(.white)
                        
                    Spacer()
                    ZStack{
                        Color.cell
                        Text(Dateformatter(date: Date.now))
                            .font(.system(size: 14, weight: .bold))
                            .foregroundStyle(.white)
                            .padding()
                    }
                    .frame(width: 100, height: 35)
                    .cornerRadius(8)
                }.padding()
                
                //MARK: - Name Habbit
                CustonTextFieldView(text: $vm.simpleHabbitName, placeholder: "Habbit title")
                    .background(content: {
                        Color.cell
                            .frame(width: 356, height: 63)
                            .cornerRadius(13)
                            
                    })
                    .focused($keyboardIsFocused)
                    .foregroundStyle(.white)
                    .padding()
                    .frame(width: 356, height: 63)
                
                //MARK: - task group
                if tasktextField > 0 {
                    CustonTextFieldView(text: $vm.simpleTaskName1, placeholder: "Task 1")
                        .background(content: {
                            Color.cell
                                .frame(width: 356, height: 63)
                                .cornerRadius(13)
                                
                        })
                        .focused($keyboardIsFocused)
                        .foregroundStyle(.white)
                        .padding()
                        .frame(width: 356, height: 63)
                }
                if tasktextField > 1 {
                    CustonTextFieldView(text: $vm.simpleTaskName2, placeholder: "Task 2")
                        .background(content: {
                            Color.cell
                                .frame(width: 356, height: 63)
                                .cornerRadius(13)
                                
                        })
                        .focused($keyboardIsFocused)
                        .foregroundStyle(.white)
                        .padding()
                        .frame(width: 356, height: 63)
                }
                if tasktextField > 2 {
                    CustonTextFieldView(text: $vm.simpleTaskName3, placeholder: "Task 3")
                        .background(content: {
                            Color.cell
                                .frame(width: 356, height: 63)
                                .cornerRadius(13)
                                
                        })
                        .focused($keyboardIsFocused)
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
                    }, label: {
                        ZStack {
                            Color.colorApp
                            Text("+").foregroundStyle(.white)
                        }
                    })
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
                    vm.clear()
                    tasktextField = 1
                    dismiss()
                }, label: {
                    BluButtonView(text: "Create")
                })
               
            }
        }
        
        .navigationBarBackButtonHidden(true)
    }
    //MARK: - Dateformatter
        private func Dateformatter(date: Date) -> String{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "d.M.yyyy"
            return dateFormatter.string(from: date)
        }
}

#Preview {
    CreateHabbitView( vm: ViewModel())
}
