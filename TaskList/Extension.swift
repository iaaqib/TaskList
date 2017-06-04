//
//  Extension.swift
//  TaskList
//
//  Created by Aaqib Hussain on 4/6/17.
//  Copyright © 2017 Aaqib Hussain. All rights reserved.
//


import UIKit

extension UIViewController{
    
    func showAddTaskAlert(title:String, message:String,buttonTitle: String, textFieldText : String? = nil, completionHandler:@escaping (_ text: String?)->()){
        
        let alert = UIAlertController(title: title, message: message,
                                      preferredStyle: .alert)
        let addAction = UIAlertAction(title: buttonTitle,
                                      style: .default) { (action: UIAlertAction!) -> Void in
                                        let textField = alert.textFields![0]
                                        guard let text = textField.text else {return}
                                        completionHandler(text)
                                        
        }
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .destructive) { (action: UIAlertAction!) -> Void in
        }
        alert.addTextField { (textField: UITextField!) -> Void in
            textField.placeholder = message
            textField.text = textFieldText
        }
        alert.addAction(cancelAction)
        alert.addAction(addAction)
        present(alert, animated: true,
                completion: nil)
        
    }
    
    func showAlert(title: String, message: String){
    
        let alert = UIAlertController(title: title, message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                                      style: .default) { (action: UIAlertAction!) -> Void in
                                        
        }
        alert.addAction(okAction)
        present(alert, animated: true,
                completion: nil)
    
    
    }
    
    
    
    
    
}
