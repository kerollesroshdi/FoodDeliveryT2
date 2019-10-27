//
//  FoodItemCell.swift
//  FoodDelivery
//
//  Created by Osama on 10/27/19.
//  Copyright © 2019 Osama Gamal. All rights reserved.
//

import UIKit

class FoodItemCell: UITableViewCell {
    @IBOutlet weak var quantityView: QuantityView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        quantityView.didPressOnButton = { item in
            switch item {
            case .plus:
                print("pressed plus")
            case .minus:
                print("pressed minus")
            }
        }
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
