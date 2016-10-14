//
//  SecondViewController.swift
//  ToDoList
//
//  Created by David on 10/13/16.
//  Copyright © 2016 dmsmith. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    var items = [String]()
    
    let ITEMS_STRING:String = "items"
    
    @IBOutlet weak var itemToAdd: UITextField!
    
    @IBAction func addTask(_ sender: AnyObject) {
        let itemsObject = UserDefaults.standard.object(forKey: ITEMS_STRING)
        
        // If there's already an array in storage append to it
        if  let tempItems = itemsObject as? [String] {
            items = tempItems
            items.append(itemToAdd.text!)
        }
        // Else create a new array with the data
        else {
            items = [itemToAdd.text!]
        }
        // Set Dictionary
        UserDefaults.standard.set(items, forKey: ITEMS_STRING)
        // Reset Text Field
        resetTextField()
    }
    
    func resetTextField() {
        itemToAdd.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // Reset Keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // Reset Keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

