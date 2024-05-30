//
//  ViewModel.swift
//  HandyHabbits
//
//  Created by Роман on 28.05.2024.
//

import Foundation
import CoreData
import SwiftUI

final class ViewModel: ObservableObject{
    
    let manager = CoreDataManager.instance
    
    @Published  var habbits: [Habbit] = []
    @Published  var tasks: [Task] = []
    @Published var simpleHabbitName = ""
    @Published var simpleTaskName1 = ""
    @Published var simpleTaskName2 = ""
    @Published var simpleTaskName3 = ""
    @Published var isComleted = false
    
    init(){
        getHabbits()
        getTasks()
    }
    
    //MARK: - CHECK
    func checkingForCompletedTasks(orHabbit habbit: Habbit){
        getTasks()
        isComleted = false
        var andTask = 0
        var taskcount = 0
        
        for task in tasks {
            if task.habbits == habbit {
                taskcount += 1
                
                if task.completed {
                    andTask += 1
                }
            }
        }
        if andTask == taskcount{
            isComleted = true
            
        }else{
            isComleted = false
        }
        
    }
    
    //MARK: - DELETE
    func deleteHabbit(with id: ObjectIdentifier){
        let request = NSFetchRequest<Habbit>(entityName: "Habbit")
        do{
            habbits = try manager.context.fetch(request)
            
            guard let habbit = habbits.first(where: { $0.id == id }) else { return  }
            getTasks()
            for task in tasks {
                if task.habbits == habbit {
                    manager.context.delete(task)
                }
            }
            manager.context.delete(habbit)
            
        }catch let error {
            print("Dont updata: \(error.localizedDescription)")
        }
        save()
    }
    
    //MARK: - UPDATA
    func updataTask(with id: ObjectIdentifier, completed: Bool){
        let request = NSFetchRequest<Task>(entityName: "Task")
        do{
            tasks = try manager.context.fetch(request)
            
            let task = tasks.first(where: { $0.id == id })
            task?.completed = completed
        }catch let error {
            print("Dont updata: \(error.localizedDescription)")
        }
        save()
    }
    
    //MARK: - GET
    func getHabbits(){
        let request = NSFetchRequest<Habbit>(entityName: "Habbit")
        
        do {
            habbits = try manager.context.fetch(request)
        }catch let error {
            print("Error fetching: \(error.localizedDescription)")
        }
    }
    
    func getTasks(){
        let request = NSFetchRequest<Task>(entityName: "Task")
        do{
            tasks = try manager.context.fetch(request)
        }catch let error {
            print("not get tasks: \(error)")
        }
    }
    
    //MARK: - ADD
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
    
    //MARK: - SAVE
    func save(){
        // habbits.removeAll()
        tasks.removeAll()
        
        // DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){ [self] in
        self.manager.save()
        self.getTasks()
        self.getHabbits()
        // }
    }
    
}
