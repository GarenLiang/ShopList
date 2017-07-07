//
//  ListTableViewCell.swift
//  ShopList
//
//  Created by GarenLiang on 2017/7/7.
//  Copyright © 2017年 GarenLiang. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var totalItemsLabel: UILabel!

    @IBOutlet weak var totalPriceLabel: UILabel!
    
    @IBOutlet weak var date: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func bindData(item: ShoppingList) {
        let currentDateFormatter = dateFormatter()
        currentDateFormatter.dateFormat = "dd/MM/YYYY"
        let date2 = currentDateFormatter.string(from: item.date)
        
        self.nameLabel.text = item.name
        self.totalItemsLabel.text = "\(item.totalItems) Items"
        self.totalPriceLabel.text = "Total $ \(String(format: "%.2f", item.totalPrice))"
        self.date.text = date2
        
        self.totalPriceLabel.sizeToFit()
        self.nameLabel.sizeToFit()
    }

}
