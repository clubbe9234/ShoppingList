//
//  ViewController.swift
//  ShoppingList
//
//  Created by Caroline Lubbe on 2/11/19.
//  Copyright © 2019 John Hersey High School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var newItemTextField: UITextField!
    var Items: [Item] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        let itemOne = Item(name: "Milk", quantity: 2)
        let itemTwo = Item(name: "Juice", quantity: 5)
        let itemThree = Item(name: "Ice Cream", quantity: 20)
        Items = [itemOne, itemTwo, itemThree]
    }

    @IBAction func whenAddNewItemButtonPressed(_ sender: UIBarButtonItem) {
        if let newItemName = newItemTextField.text, newItemName != "" {
            let newItem = Item(name: newItemName, quantity: 1)
            Items.append(newItem)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") {
            let currentItemName = Items[indexPath.row].name
            let currentItemQuantity = Items[indexPath.row].quantity
            cell.textLabel?.text = currentItemName
            cell.detailTextLabel?.text = "quantity: \(currentItemQuantity)"
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

