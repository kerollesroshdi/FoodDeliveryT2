//
//  ViewController.swift
//  FoodDelivery
//
//  Created by Osama on 10/24/19.
//  Copyright © 2019 Osama Gamal. All rights reserved.
//

import UIKit

extension ViewController: UIViewControllerPreviewingDelegate {
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        if let selectedIndex = tableView.indexPathForRow(at: location) {
            let item = self.Resturants?[selectedIndex.row]
//            if let image = item? {
                let view = self.storyboard?.instantiateViewController(withIdentifier: "PeekAndPopViewController") as! PeekAndPopViewController
                view.data = item
                return view
//            }
        }
        return ViewController()
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        if let view = viewControllerToCommit as? PeekAndPopViewController {
            let restView = self.storyboard?.instantiateViewController(withIdentifier: "ResturantViewController") as! ResturantViewController
            restView.data = view.data
            self.navigationController?.pushViewController(restView, animated: true)
        }
    }
    

}
