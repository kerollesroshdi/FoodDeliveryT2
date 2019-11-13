//
//  CustomTabBar.swift
//  FoodDelivery
//
//  Created by Osama on 10/27/19.
//  Copyright © 2019 Osama Gamal. All rights reserved.
//

import UIKit

protocol CustomTabBarDelegate: class {
    func didPressOnButton(type: CustomTabBar.CustomTabBarButtons)
    func didPressOnCart()
}

class CustomTabBar: UIView {
    enum CustomTabBarButtons: Int {
        case home
        case loved
    }
    
    weak var delegate: CustomTabBarDelegate?
    
    @IBOutlet var containerView: UIView!
    @IBOutlet weak var lineViewCenterX: NSLayoutConstraint!
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("It is working")
        commonInit()
    }
    
    func commonInit(){
        if let nibView = Bundle.main.loadNibNamed("CustomTabBar", owner: self, options: nil)?.first as? UIView{
            nibView.frame = self.bounds
            self.addSubview(nibView)
            containerView = nibView
        }
    }
    
    @IBAction func didPressOnHome(_ sender: UIButton) {
        delegate?.didPressOnButton(type: .home)
        UIView.animate(withDuration: 0.4) {
            self.lineViewCenterX.constant = sender.frame.origin.x
            AnimationsFactory.animate(sender, animationType: .glow(from: 0.2))
            self.layoutIfNeeded()
        }
    }
    
    @IBAction func didPressOnLoved(_ sender: UIButton) {
        delegate?.didPressOnButton(type: .loved)
        UIView.animate(withDuration: 0.4) {
            self.lineViewCenterX.constant = sender.frame.origin.x
            AnimationsFactory.animate(sender, animationType: .glow(from: 0.2))
            self.layoutIfNeeded()
        }
    }
    
    @IBAction func didPressOnCart(_ sender: Any) {
        delegate?.didPressOnCart()
    }
}
