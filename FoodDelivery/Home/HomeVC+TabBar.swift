//
//  HomeVC.swift
//  FoodDelivery
//
//  Created by Osama on 10/24/19.
//  Copyright © 2019 Osama Gamal. All rights reserved.
//

import UIKit

extension HomeVC: CustomTabBarDelegate {
    func didPressOnCart() {
        let cartVC = self.storyboard?.instantiateViewController(withIdentifier: "CartVC") as! CartVC
        self.navigationController?.pushViewController(cartVC, animated: true)
    }
    
    func didPressOnButton(type: CustomTabBar.CustomTabBarButtons) {
        switch type {
        case .home:
            print("pressed home")
        case .profile:
            print("pressed profile")
        }
    }
}
