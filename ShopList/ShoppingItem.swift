//
//  ShoppingItem.swift
//  ShopList
//
//  Created by GarenLiang on 2017/7/16.
//  Copyright © 2017年 GarenLiang. All rights reserved.
//

import Foundation

class ShoppingItem {
    var name: String
    var info: String
    var quantity: String
    var price: Float
    var shoppingItemId: String
    var shoppingListId: String
    var isBought: Bool
    var image: String
    
    init(_name: String, _info: String = "", _quantity: String = "1", _price: Float, _shoppingListId: String) {
        name = _name
        info = _info
        quantity = _quantity
        price = _price
        shoppingItemId = ""
        shoppingListId = _shoppingListId
        isBought = false
        image = ""
    }
    init(dictionary: NSDictionary) {
        name = dictionary[kNAME] as! String
        info = dictionary[kINFO] as! String
        quantity = dictionary[kQUANTITY] as! String
        price = dictionary[kPRICE] as! Float
        shoppingItemId = dictionary[kSHOPPINGITEM] as! String
        shoppingListId = dictionary[kSHOPPINGLISTID] as! String
        isBought = dictionary[kISBOUGHT] as! Bool
        image = dictionary[kIMAGE] as! String
    }
    func dictionaryFromItem(item: ShoppingItem) -> NSDictionary {
        return NSDictionary(objects: [item.name, item.info, item.quantity, item.price, item.shoppingItemId, item.shoppingListId, item.isBought, item.image], forKeys: [kNAME as NSCopying,kINFO as NSCopying, kQUANTITY as NSCopying, kPRICE as NSCopying, kSHOPPINGITEMID as NSCopying, kSHOPPINGLISTID as NSCopying, kISBOUGHT as NSCopying, kIMAGE as NSCopying])
    }
    
    func saveItemInBackground(shoppingItem: ShoppingItem, completion: @escaping (_ error: Error?) -> Void) {
        let ref = firebase.child(kSHOPPINGITEM).child(shoppingItem.shoppingListId).childByAutoId()
        shoppingItem.shoppingItemId = ref.key
        
        ref.setValue(dictionaryFromItem(item: shoppingItem)) {
            (error, ref) -> Void in completion(error)
        }
    }
    func deleteItemInBackground(shoppingItem: ShoppingItem) {
        let ref = firebase.child(kSHOPPINGITEM).child(shoppingItem.shoppingListId).child(shoppingItem.shoppingItemId)
        ref.removeValue()
    }

}
