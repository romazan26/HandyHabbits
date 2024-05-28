//
//  MyHabbitsView.swift
//  HandyHabbits
//
//  Created by Роман on 23.05.2024.
//

import SwiftUI

struct MyHabbitsView: View {
    
    @StateObject var vm = ViewModel()
    @State private var isOn = false
    
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
                        Toggle(isOn: $isOn) {
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Label@*/Text("Label")/*@END_MENU_TOKEN@*/
                        }
                    }.padding()
                    Spacer()
                    //MARK: - Habbits List
                    if vm.habbits.isEmpty
                    {
                        Text("Empty").foregroundStyle(.gray)
                    }else{
                        ScrollView {
                            ForEach(vm.habbits) { habbit in
                                HabbitsCellView(habbit: habbit)
                            }
                        }
                    }
                    Spacer()
                    NavigationLink {
                        CreateHabbitView(vm: vm)
                    } label: {
                        BluButtonView(text: "New habbits")
                    }

                   
                }
            }
        }
    }
}

#Preview {
    MyHabbitsView()
}
