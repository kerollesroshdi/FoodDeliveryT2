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
        NetworkClient.performRequest([Order].self, router: .PlaceOrder(order: order), success: { model, message  in
            print("message:", message)
            
            var style: ToastStyle {
                var style = ToastStyle()
                style.messageColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
                style.titleColor = .black
                style.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 0.3016340229)
                style.messageAlignment = .center
                style.titleAlignment = .center
                style.horizontalPadding = 50
                return style
            }
            
            self.view.makeToast(message, duration: 2, position: .center, title: "your order is on the way", image: nil, style: style, completion: nil)
            CartManager.shared.items.removeAll()
            self.itemsTableView.reloadData()
        }) { (error) in
            print("error placing an Order : \(error)")
        }
        
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
