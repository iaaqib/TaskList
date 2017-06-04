//
//  TaskViewModel.swift
//  TaskList
//
//  Created by Aaqib Hussain on 4/6/17.
//  Copyright © 2017 Aaqib Hussain. All rights reserved.
//

import Foundation
import CoreData


class TaskViewModel {

    
    private var coreDataModel = CoreDataModel()
    
     var tasks : [Task] {
        get {
        return self.coreDataModel.tasks
        }
        set(newTasks){
        self.tasks = newTasks
        }
    }
    
    /**Further Data Passing to CoreData
    **/
    func setTask(task : String?){
        guard let task = task else {return}
        self.coreDataModel.setTaskToCD(taskName: task)
        print(#function)
        print(self.tasks.count)
        
    }
    func removeTask(row: Int){
    self.coreDataModel.removeTaskFromCD(row: row)
        print(#function)
        print(self.tasks.count)
    }
    func updateTask(task: Task){
    self.coreDataModel.updateTaskInCD(task: task)
    
    }


}
