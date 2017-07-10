//
//  ShoppingItemViewController.swift
//  ShopList
//
//  Created by GarenLiang on 2017/7/4.
//  Copyright © 2017年 GarenLiang. All rights reserved.
//

import UIKit

class ShoppingItemViewController: UIViewController {

    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var itemsLeftLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var shoppingList: ShoppingList!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //action
    @IBAction func addBarButtonItemPressed(_ sender: Any) {
    }
    

}
