//
//  TaskViewModel.swift
//  TaskList
//
//  Created by Aaqib Hussain on 4/6/17.
//  Copyright © 2017 Aaqib Hussain. All rights reserved.
//

import Foundation



class TaskViewModel {
    
    
    private var coreDataModel = CoreDataModel()
    
    //Holds the Task Objects from CoreData
    var tasks : [Task] {
        get {
            return self.coreDataModel.tasks
        }
        set(newTasks){
            self.tasks = newTasks
        }
    }
    
    // Further Data Passing to CoreData class
    
    func setTask(task : String?){
        guard let task = task else {return}
        self.coreDataModel.setTaskToCD(taskName: task)
        
        
    }
    func removeTask(row: Int){
        self.coreDataModel.removeTaskFromCD(row: row)
        
    }
    func updateTask(task: Task){
        self.coreDataModel.updateTaskInCD(task: task)
        
    }
    
    
}
