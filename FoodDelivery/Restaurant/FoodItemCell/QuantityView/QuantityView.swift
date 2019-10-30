//
//  QuantityView.swift
//  FoodDelivery
//
//  Created by Osama on 10/27/19.
//  Copyright © 2019 Osama Gamal. All rights reserved.
//

import Foundation
import UIKit


class QuantityView: UIView {
    enum QuantityViewItems : Int{
        case plus
        case minus
    }
    var count = 0 {
        didSet{
            valueLabel.text = "\(count)"
        }
    }
    
    @IBOutlet var containerView: UIView!
    @IBOutlet var valueLabel: UILabel!

    var didPressOnButton: ( (QuantityViewItems) -> Void )?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        valueLabel.text = "\(count)"
    }
    
    func validate() -> Bool {
        if(count < 0){
            return false
        } else {
            return true
        }
    }
    
    @IBAction func didPressOnButton(_ sender: UIButton){
//        guard validate() == true else { return }
        if let selectedButton = QuantityViewItems(rawValue: sender.tag){
            switch selectedButton {
            case .plus:
                count += 1
            case .minus:
                count > 0 ? count -= 1 : nil
            }
            didPressOnButton?(selectedButton)
        }
    }
    
    func commonInit(){
        guard let nibView = Bundle.main.loadNibNamed("QuantityView", owner: self, options: nil)?.first as? UIView else { return }
        nibView.frame = self.bounds
        self.addSubview(nibView)
        containerView = nibView
    }
}
