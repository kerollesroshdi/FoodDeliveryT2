//
//  ResturantsHeaderCell.swift
//  FoodDelivery
//
//  Created by Osama on 10/24/19.
//  Copyright © 2019 Osama Gamal. All rights reserved.
//

import UIKit

class ResturantsHeaderCell: UITableViewHeaderFooterView {
    @IBOutlet weak var containerView: UIView!
    
    lazy var cornerMask: CAShapeLayer = {
        let path = UIBezierPath(roundedRect: CGRect.init(x: 0, y: 0, width: containerView.bounds.width - 60, height: containerView.bounds.height), byRoundingCorners: [.topRight, .topLeft], cornerRadii: CGSize(width: 35, height: 35))
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        
        return maskLayer
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.mask = cornerMask
        
        // Initialization code
    }


}
