//
//  ViewController.swift
//  Challenge2
//
//  Created by chams on 21/11/2018.
//  Copyright © 2018 Chams. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var shoppingList =  [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Cart"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        cell.textLabel?.text = shoppingList[indexPath.row]
        
        return cell
    }
    
    @objc func addItem() {
        let ac = UIAlertController(title: "New Item", message: "Please enter Item name", preferredStyle: .alert)
        ac.addTextField()
        
        let submissionAction = UIAlertAction(title: "Add", style: .default) { [unowned self, ac] (action: UIAlertAction) in
            let item = ac.textFields![0]
            self.submit(item: item.text!)
        }
        
        ac.addAction(submissionAction)
        present(ac, animated: true)
    }
    
    func checkForError(title: String, message: String) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Retry", style: .cancel))
        present(ac, animated: true)
    }
    
    func submit(item: String) {
        guard !item.isEmpty else {
            checkForError(title: "Empty", message: "The item is empty")
            return
        }
        shoppingList.insert(item, at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
}

