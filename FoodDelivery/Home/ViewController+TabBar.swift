//
//  ViewController.swift
//  FoodDelivery
//
//  Created by Osama on 10/24/19.
//  Copyright © 2019 Osama Gamal. All rights reserved.
//

import UIKit

extension ViewController: CustomTabBarDelegate {
    func didPressOnButton(type: CustomTabBar.CustomTabBarButtons) {
        switch type {
        case .home:
            print("pressed home")
        case .profile:
            print("pressed profile")
        }
    }
}
