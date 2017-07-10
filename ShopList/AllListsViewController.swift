//
//  AllListsViewController.swift
//  ShopList
//
//  Created by GarenLiang on 2017/7/3.
//  Copyright © 2017年 GarenLiang. All rights reserved.
//

import UIKit
import KRProgressHUD

class AllListsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    var allLists:[ShoppingList] = []
    var nameTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadLists()
        // Do any additional setup after loading the view.
    }
    
    //table view datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as!
            ListTableViewCell
        let shoppingList = allLists[indexPath.row]
        
        cell.bindData(item: shoppingList)
        
        return cell
    }
   
    // tableview delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "shoppingListToShoppingItemSeg", sender: indexPath)
    }
    
    
    //Action
    
    @IBAction func addBarButtonItemPressed(_ sender: Any) {
        let alertController = UIAlertController(title: "Create Shopping List", message: "Enter the shopping list name", preferredStyle: .alert)
        alertController.addTextField { (nameTextField) in
            nameTextField.placeholder = "Name"
            self.nameTextField = nameTextField
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            
        }
        let saveAction = UIAlertAction(title: "Save", style: .default) { (action) in
            if self.nameTextField.text != "" {
                self.createShoppingList()
            } else {
                //show message
                KRProgressHUD.showWarning(message: "name is empty")
            }
            
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    //LoadList
    func loadLists() {
        firebase.child(kSHOPPINGLIST).child("123").observe(.value, with: {
            snapshot in
            self.allLists.removeAll()
            
            if snapshot.exists() {
                let sorted = ((snapshot.value as! NSDictionary).allValues as NSArray).sortedArray(using: [NSSortDescriptor(key: kDATE, ascending: false)])
                
                for list in sorted {
                    let currentList = list as! NSDictionary
                    self.allLists.append(ShoppingList.init(dictionary: currentList))
                }
            } else {
                print("no snapshot")
            }
            self.tableView.reloadData()
        })
    }
    //Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "shoppingListToShoppingItemSeg" {
            let indexPath = sender as! IndexPath
            let shoppingList = allLists[indexPath.row]
            
            let vc = segue.destination as! ShoppingItemViewController
            vc.shoppingList = shoppingList
        }
    }
    //helper function
    func createShoppingList() {
        let shoppingList = ShoppingList(_name: nameTextField.text!)
        shoppingList.saveItemInBackground(shoppingList: shoppingList) { (error) in
            if error != nil {
                KRProgressHUD.showError(message: "Error creating shopping list")
                return
            }
        }
    }

    }
