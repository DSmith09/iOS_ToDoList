//
//  FirstViewController.swift
//  ToDoList
//
//  Created by David on 10/13/16.
//  Copyright © 2016 dmsmith. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // Interface Builder Variables
    @IBOutlet weak var tableView: UITableView!
    
    // Constants and Variables
    let ITEMS_STRING = "items"
    var items = [String]()
    
    // Set Table View Size
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    // Set Value in Each Cell
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Main")
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // Retrieve Data From Storage on App Load
        let itemsObject = UserDefaults.standard.object(forKey: ITEMS_STRING)
        if  let tempItems = itemsObject as? [String] {
            items = tempItems
        }
        // Reload the data in the view
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // If Delete is Selected; Remove the Item from the Array and reload the view; Set the Data Storage
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            items.remove(at: indexPath.row)
            tableView.reloadData()
            UserDefaults.standard.set(items, forKey: ITEMS_STRING)
        }
    }


}

