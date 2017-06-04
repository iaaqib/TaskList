//
//  TaskListViewController.swift
//  TaskList
//
//  Created by Aaqib Hussain on 3/6/17.
//  Copyright © 2017 Aaqib Hussain. All rights reserved.
//

import UIKit

class TaskListViewController: UITableViewController {
    
    lazy var taskViewModel = TaskViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    //MARK: Action
    @IBAction func addTask(_ sender: UIBarButtonItem){
        
        self.add()
    }
    //MARK: Functions
    //Passes Task to ViewModel
    func add(){
        self.showAddTaskAlert(title: "Task", message: "Add A Task", buttonTitle: "Add") { (text) in
            if let task = text, task != ""{
                self.taskViewModel.setTask(task: task)
                self.tableView.reloadData()
            }
            else{
                self.showAlert(title: "Cannot Proceed", message: "Task cannot be empty")
            }
        }
        
        
        
    }
    //Passes updates to ViewModel
    func update(row: Int){
        
        let updatedTask = self.taskViewModel.tasks[row]
        
        self.showAddTaskAlert(title: "Update", message: "Update A Task", buttonTitle: "Update", textFieldText: updatedTask.task) { (text) in
            
            if let task = text, task != ""{
                
                updatedTask.task = task
                self.taskViewModel.updateTask(task: updatedTask)
                self.tableView.reloadData()
            }
            else{
                self.showAlert(title: "Cannot Proceed", message: "Task cannot be empty")
            }
        }
    }
    
}
extension TaskListViewController{
    
    
    //MARK: TableView Datasource
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let task = self.taskViewModel.tasks[indexPath.row]
        cell.textLabel?.text = task.task
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.taskViewModel.tasks.count
    }
    
    //MARK: TableView Delegate
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        //Update Row Action
        let updateRowAction = UITableViewRowAction(style: .default, title: "Update", handler:{action, indexpath in
            self.update(row: indexPath.row)
            
        })
        updateRowAction.backgroundColor = UIColor(red: 0.298, green: 0.851, blue: 0.3922, alpha: 1.0)
        
        //Delete Row Action
        let deleteRowAction = UITableViewRowAction(style: .destructive, title: "Delete", handler:{action, indexpath in
            self.taskViewModel.removeTask(row: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        })
        
        
        return [deleteRowAction, updateRowAction];
    }
    
    
    
    
    
    
}
