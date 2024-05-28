//
//  ViewModel.swift
//  HandyHabbits
//
//  Created by Роман on 28.05.2024.
//

import Foundation
import CoreData

final class ViewModel: ObservableObject{
    
    let manager = CoreDataManager.instance
    
    @Published  var habbits: [Habbit] = []
    @Published  var tasks: [Task] = []
    @Published var simpleHabbitName = ""
    @Published var simpleTaskName1 = ""
    @Published var simpleTaskName2 = ""
    @Published var simpleTaskName3 = ""
    
    init(){
        getHabbits()
    }
    
    func getHabbits(){
        let request = NSFetchRequest<Habbit>(entityName: "Habbit")
            
        do {
            habbits = try manager.context.fetch(request)
        }catch let error {
            print("Error fetching: \(error.localizedDescription)")
        }
    }
    
    func addTask(simpleTask: String){
        if !simpleTask.isEmpty{
            let newTask = Task(context: manager.context)
            newTask.name = simpleTask
            newTask.completed = false
            
            newTask.habbits = habbits.last
            save()
        }
    }
    
    func addHabbit(){
        let newHabbit = Habbit(context: manager.context)
        newHabbit.name = simpleHabbitName
        newHabbit.date = Date()
        save()
        
    }
    
    func save(){
        manager.save()
        getHabbits()
    }
    
}
