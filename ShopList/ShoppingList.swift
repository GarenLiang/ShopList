//
//  ShoppingList.swift
//  ShopList
//
//  Created by GarenLiang on 2017/7/4.
//  Copyright © 2017年 GarenLiang. All rights reserved.
//

import Foundation
import Firebase

class ShoppingList {
    let name: String
    var totalPrice: Float
    var totalItems: Int
    var id: String
    var date: Date
    var ownerId: String
    
    init(_name: String, _totalPrice: Float = 0, _id: String = "") {
        name = _name
        totalPrice = _totalPrice
        totalItems = 0
        id = _id
        date = Date()
        ownerId = "123"
    }
    init(dictionary: NSDictionary) {
        name = dictionary[kNAME] as! String
        totalPrice = dictionary[kTOTALPRICE] as! Float
        totalItems = dictionary[kTOTALITEMS] as! Int
        id = dictionary[kSHOPPINGLIST] as! String
        date = dateFormatter().date(from: dictionary[kDATE] as! String)!
        ownerId = dictionary[kOWNERID] as! String
    }
    func dictionaryFromItem(item: ShoppingList) -> NSDictionary {
        return NSDictionary(objects: [item.name, item.totalPrice, item.totalItems, item.id,dateFormatter().string(from: item.date), item.ownerId], forKeys: [kNAME as NSCopying,kTOTALPRICE as NSCopying, kTOTALITEMS as NSCopying, kSHOPPINGLISTID as NSCopying, kDATE as NSCopying, kOWNERID as NSCopying])
    }
    
    func saveItemInBackground(shoppingList: ShoppingList, completion: @escaping (_ error: Error?) -> Void) {
        let ref = firebase.child(kSHOPPINGLIST).child("123").childByAutoId()
        shoppingList.id = ref.key
        
        ref.setValue(dictionaryFromItem(item: shoppingList)) {
            (error, ref) -> Void in completion(error)
    }
    }
    func deleteItemInBackground(shoppingList: ShoppingList) {
        let ref = firebase.child(kSHOPPINGLIST).child("123").child(shoppingList.id)
        ref.removeValue()
        }
}
