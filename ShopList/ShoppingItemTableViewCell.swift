//
//  ShoppingItemTableViewCell.swift
//  ShopList
//
//  Created by GarenLiang on 2017/7/18.
//  Copyright © 2017年 GarenLiang. All rights reserved.
//

import UIKit

class ShoppingItemTableViewCell: UITableViewCell {

    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bindData(item: ShoppingItem) {
        self.nameLabel.text = item.name
        self.detailLabel.text = item.info
        self.quantityLabel.text = item.quantity
        self.priceLabel.text = "$ \(item.price)"
        
        self.priceLabel.sizeToFit()
        self.nameLabel.sizeToFit()
        self.detailLabel.sizeToFit()
    }
}
