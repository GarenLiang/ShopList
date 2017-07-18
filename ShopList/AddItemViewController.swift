//
//  AddItemViewController.swift
//  ShopList
//
//  Created by GarenLiang on 2017/7/17.
//  Copyright © 2017年 GarenLiang. All rights reserved.
//

import UIKit
import KRProgressHUD
class AddItemViewController: UIViewController {
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var nameTextFiled: UITextField!
    
    @IBOutlet weak var extraInfoTextField: UITextField!
    
    @IBOutlet weak var quantityTextField: UITextField!
    
    @IBOutlet weak var priceTextField: UITextField!
    
    var shoppingList: ShoppingList!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func saveButtonPressed(_ sender: Any) {
        if nameTextFiled.text != "" && priceTextField.text != "" {
                saveItem()
        } else {
            KRProgressHUD.showWarning(message: "Empty fields!")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // saving item
    func saveItem() {
        let shoppingItem = ShoppingItem(_name: nameTextFiled.text!, _info: extraInfoTextField.text!, _quantity: quantityTextField.text!, _price: Float(priceTextField.text!)!, _shoppingListId: shoppingList.id)
        shoppingItem.saveItemInBackground(shoppingItem: shoppingItem) {(error) in
            if error != nil {
                KRProgressHUD.showError(message: "Error saving shopping item")
                return
            }
        }
    }
}
