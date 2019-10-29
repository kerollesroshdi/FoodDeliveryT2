//
//  RestTypeCell.swift
//  FoodDelivery
//
//  Created by Osama on 10/24/19.
//  Copyright © 2019 Osama Gamal. All rights reserved.
//

import UIKit
import Kingfisher
import SkeletonView

class RestTypeCell: UICollectionViewCell {
    
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        normalCell()
        titleLabel.isHidden = true
        
        // Initialization code
    }
    func normalCell (){
        self.layer.shadowOpacity = 0
        self.titleLabel.alpha = 0.7
        titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
    }
    
    func configure(_ model: CircleModel?){
        DispatchQueue.main.async{
            sleep(10)
        }
        self.showAnimatedGradientSkeleton()
        
        guard let model = model else { return }
        self.hideSkeleton()
        titleLabel.isHidden = false
        self.titleLabel.text = model.title
        if let image = model.image {
            self.img.kf.setImage(with: URL(string: image))
        }
    }
    
    override var isSelected: Bool {
        didSet {
            if(isSelected == true){
                self.layer.shadowOpacity = 1
                self.titleLabel.alpha = 1
                titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
            } else {
                normalCell()
            }
        }
    }

}
