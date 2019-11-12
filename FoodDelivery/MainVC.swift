//
//  MainVC.swift
//  FoodDelivery
//
//  Created by admin on 11/12/19.
//  Copyright © 2019 Osama Gamal. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var tabBar: CustomTabBar!
    
    var homeVC: UIViewController!
    var favouritesVC: UIViewController!
    
    var viewControllers: [UIViewController]!
    var selectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.delegate = self
        
        // creating VCs:
        let storyborad = UIStoryboard(name: "Main", bundle: nil)
        homeVC = storyborad.instantiateViewController(withIdentifier: "HomeNavigationVC")
        favouritesVC = storyborad.instantiateViewController(withIdentifier: "FavouritesVC")
        viewControllers = [homeVC, favouritesVC]
        
        didPressOnButton(type: .home)
    }
    
    

}

extension MainVC: CustomTabBarDelegate {
    func didPressOnButton(type: CustomTabBar.CustomTabBarButtons) {
        let previousIndex = selectedIndex
        selectedIndex = type.rawValue
        
        let previousVC = viewControllers[previousIndex]
        previousVC.willMove(toParent: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParent()
        
        let vc = viewControllers[selectedIndex]
        addChild(vc)
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        vc.didMove(toParent: self)
    }
    
    func didPressOnCart() {
        let cartVC = self.storyboard?.instantiateViewController(withIdentifier: "CartVC") as! CartVC
        self.present(cartVC, animated: true)
    }
    
    
}
