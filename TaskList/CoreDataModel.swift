//
//  CoreDataModel.swift
//  TaskList
//
//  Created by Aaqib Hussain on 4/6/17.
//  Copyright © 2017 Aaqib Hussain. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class CoreDataModel {
    
    //Container Context
    fileprivate lazy var context : NSManagedObjectContext = {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        return context
    }()
    
    //Contains Fetched Tasks
    lazy var tasks : [Task] = []
    //MARK: Init
    init() {
        getTask()

    }
    
    //MARK: CoreData Operations
    
    //Fetch from CoreData
    private func getTask(){
        do {
            tasks = try context.fetch(Task.fetchRequest())
           // debugPrint("TaskName:\(tasks.taskId)")
           // debugPrint("TaskID:\(tasks.taskId)")
        }
        catch {
            print("Fetching Failed")
        }
    }
    //Sets Task in CoreData
    func setTaskToCD(taskName:String){
        let task = Task(context: context)
        task.task = taskName
        debugPrint("TaskName:\(task.task)")

        //If has a last task add 1 to the id and save else set id to 0
        if let lastTaskId = self.tasks.last?.taskId{
        let id = lastTaskId + 1
        task.taskId = id

        }
        else{
        task.taskId = 0
        }
        self.tasks.append(task)
        self.saveContext()
        print(#function)
        print(self.tasks.count)
        
        debugPrint("TaskID:\(task.taskId)")
    
    }
    //Remove Task from CoreData
    func removeTaskFromCD(row: Int){
        let task = self.tasks[row]
        self.context.delete(task)
        self.tasks.remove(at: row)
        self.saveContext()
    
    
    }
    //Updates Task in CoreData
    func updateTaskInCD(task: Task){
        let updatedTask = self.tasks.filter({$0.taskId == task.taskId})
        updatedTask.first?.task = task.task
        self.saveContext()
        
    }
    
    private func saveContext(){
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
    }
    
  
}
