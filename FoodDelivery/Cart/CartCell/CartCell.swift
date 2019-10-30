//
//  CartCell.swift
//  FoodDelivery
//
//  Created by admin on 10/30/19.
//  Copyright © 2019 Osama Gamal. All rights reserved.
//

import UIKit

class CartCell: UITableViewCell {
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var itemDetails: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var quantityView: QuantityView!
    
    var item: ResturantFood?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        quantityView.didPressOnButton = { item in
            switch item {
            case .plus:
                print("pressed plus")
                CartManager.shared.addItem(self.item!)
            case .minus:
                print("pressed minus")
                CartManager.shared.removeItem(self.item!)
            }
            print(CartManager.shared.totalItems)
        }
    }
    
    func configureCellWith(item: ResturantFood) {
        self.item = item
        
        if let image = item.image {
            itemImage.kf.indicatorType = .activity
            itemImage.kf.setImage(with: URL(string: image))
        }
        itemLabel.text = item.title
        itemDetails.text = ""
        itemPrice.text = "Price \(item.price ?? 0)"
        totalPrice.text = item.formatedTotalPrice()
        quantityView.count = item.quantity ?? 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
