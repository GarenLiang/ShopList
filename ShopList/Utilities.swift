//
//  Utilities.swift
//  ShopList
//
//  Created by GarenLiang on 2017/7/5.
//  Copyright © 2017年 GarenLiang. All rights reserved.
//

import Foundation
import UIKit

private let dateFormat = "yyyyMMddHHmmss"

func dateFormatter() -> DateFormatter {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = dateFormat
    
    return dateFormatter
}
