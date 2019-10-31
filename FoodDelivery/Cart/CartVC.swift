//
//  CartVC.swift
//  FoodDelivery
//
//  Created by admin on 10/30/19.
//  Copyright © 2019 Osama Gamal. All rights reserved.
//

import UIKit
import Toast_Swift

class CartVC: UIViewController {
    @IBOutlet weak var itemsTableView: UITableView!
    @IBOutlet weak var subTotalLabel: UILabel!
    @IBOutlet weak var checkoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemsTableView.registerCellNib(cellClass: CartCell.self)
        subTotalLabel.text = "\(CartManager.shared.cartTotal)"
        if CartManager.shared.items.isEmpty { checkoutButton.isEnabled = false; checkoutButton.alpha = 0.4 }
    }
    
    @IBAction func checkoutButtonPressed(_ sender: Any) {
        // send request to API :
        let items = CartManager.shared.items
        let order = Order(items: items)
        
        self.view.makeToastActivity(.center)
        
        NetworkClient.performRequest([Order].self, router: .PlaceOrder(order: order), success: { model, message  in
            print("message:", message)
            
            self.view.hideToastActivity()
            
            self.view.makeToast(message, duration: 3, position: .center, title: "your order is on the way", image: nil, style: ToastManager.shared.style, completion: nil)
            
            self.view.makeToast(message, duration: 3, position: .center, title: "your order is on the way", image: nil, style: ToastManager.shared.style) { (completed) in
                 self.navigationController?.popViewController(animated: true)
            }
            
            CartManager.shared.items.removeAll()
            self.itemsTableView.reloadData()
            self.subTotalLabel.text = "0"
            self.checkoutButton.isEnabled = false; self.checkoutButton.alpha = 0.4
        }) { (error) in
            print("error placing an Order : \(error)")
        }
        
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func edgePanned(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
