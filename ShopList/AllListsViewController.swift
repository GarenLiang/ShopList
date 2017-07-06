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

        // Do any additional setup after loading the view.
    }
    
    //table view datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
