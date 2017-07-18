//
//  ShoppingItemViewController.swift
//  ShopList
//
//  Created by GarenLiang on 2017/7/4.
//  Copyright © 2017年 GarenLiang. All rights reserved.
//

import UIKit

class ShoppingItemViewController: UIViewController, UITabelViewDataSource, UITableViewDelegate {

    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var itemsLeftLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var shoppingList: ShoppingList!
    var shoppingItems: [ShoppingItem] = []
    var boughtItems: [ShoppingItem] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    // tableview data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return shoppingItems.count
        } else {
            return boughtItems.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ShoppingItemTableViewCell
        var item: ShoppingItem!
        if indexPath.section == 0 {
            item = shoppingItems[indexPath.row]
        } else {
            item = boughtItems[indexPath.row]
        }
        cell.bindData(item: item)
        
        return cell
    }
    
    
    //action
    @IBAction func addBarButtonItemPressed(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddItemVC") as! AddItemViewController
        
        vc.shoppingList = self.shoppingList
        self.present(vc, animated: true, completion: nil)
    }
    
    //load shoppingItems
    func loadShoppingItems() {
        firebase.child(kSHOPPINGITEM).child(shoppingList.id).queryOrdered(byChild:
            kSHOPPINGLISTID).queryEqual(toValue: shoppingList.id).observe(.value, with: {
                snapshot in
                
                self.shoppingItems.removeAll()
                self.boughtItems.removeAll()
                
                if snapshot.exists() {
                    let allItems = (snapshot.value as! NSDictionary).allValues as Array
                    for item in allItems {
                        let currentItem = ShoppingItem.init(dictionary: item as! NSDictionary)
                        
                        if currentItem.isBought {
                            self.boughtItems.append(currentItem)
                        } else {
                            self.shoppingItems.append(currentItem)
                        }
                    }
                } else {
                    print("no snapshot")
                }
            })
    }

}
