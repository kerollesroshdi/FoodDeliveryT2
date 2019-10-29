//
//  BaseTableViewCell.swift
//  FoodDelivery
//
//  Created by Osama on 10/29/19.
//  Copyright © 2019 Osama Gamal. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure<T>(_ item: T?){
        guard let _ = item else { return }
    }

}
