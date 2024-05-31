//
//  MyHabbitsView.swift
//  HandyHabbits
//
//  Created by Роман on 23.05.2024.
//

import SwiftUI

struct MyHabbitsView: View {
    
    @StateObject var vm = ViewModel()
    @State private var isOn = true
    
    var body: some View {
        NavigationView {
            ZStack {
                //MARK: - Background
                Color(.colorApp).ignoresSafeArea()
                
                VStack {
                    //MARK: - Toollbar
                    HStack {
                        Text("My habbits")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundStyle(.white)
                        Spacer()
                        Toggle("", isOn: $isOn)
                            .toggleStyle(CustonToggleStyle())
                    }.padding()
                    Spacer()
                    
                    //MARK: - Habbits List
                    if vm.habbits.isEmpty
                    {
                        Text("Empty").foregroundStyle(.gray)
                    }else if isOn {
                        ScrollView {
                            ForEach(vm.habbits) { habbit in
                                HabbitsCellView(habbit: habbit, viewModel: vm)
                            }
                        }
                    } else {
                        ScrollView {
                            ForEach(vm.habbits) { habbit in
                                HabbitsCellSmallView(habbit: habbit, viewModel: vm)
                            }
                        }
                    }
                    Spacer()
                    
                    //MARK: - Newhabbits button
                    NavigationLink {
                        CreateHabbitView(vm: vm)
                    } label: {
                        BluButtonView(text: "New habbits")
                    }
                }
            }
            .animation(.spring, value: isOn)
            .animation(.easeIn, value: vm.habbits)
        }
    }
}

#Preview {
    MyHabbitsView()
}

//MARK: - CustonToggleStyle
struct CustonToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        let isOn = configuration.isOn
        
        return ZStack{
            RoundedRectangle(cornerRadius: 27)
                .frame(width: 105, height: 40)
                .foregroundStyle(.cell)
            HStack{
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 49, height: 32)
                    .foregroundStyle(isOn ? .bluButton : .cell)
                    RoundedRectangle(cornerRadius: 2)
                        .frame(width: 19, height: 19)
                        .foregroundStyle(isOn ? .white : .gray)
                }
                .onTapGesture {
                    configuration.isOn = true
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 49, height: 32)
                    .foregroundStyle(!isOn ? .bluButton : .cell)
                    RoundedRectangle(cornerRadius: 2)
                        .frame(width: 19, height: 12)
                        .foregroundStyle(!isOn ? .white : .gray)
                }
                .onTapGesture {
                    configuration.isOn = false
                }
            }
        }
        
    }
}
