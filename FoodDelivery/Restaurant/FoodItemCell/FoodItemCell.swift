//
//  FoodItemCell.swift
//  FoodDelivery
//
//  Created by Osama on 10/27/19.
//  Copyright © 2019 Osama Gamal. All rights reserved.
//

import UIKit

class FoodItemCell: BaseTableViewCell {
    @IBOutlet weak var quantityView: QuantityView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var priceLabe: UILabel!
    
    @IBOutlet weak var img: UIImageView!
    var item: ResturantFood?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
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
        
        // Initialization code
    }
    override func configure<T>(_ item: T?) {
        guard let item = item as? ResturantFood else { return }
        self.item = item
        self.titleLabel.text = item.title
        self.priceLabe.text = item.formattedPrice()
        if let image = item.image {
            img.kf.indicatorType = .activity
            self.img.kf.setImage(with: URL(string: image))
        }
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
