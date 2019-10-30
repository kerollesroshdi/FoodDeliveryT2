//
//  CartVC.swift
//  FoodDelivery
//
//  Created by admin on 10/30/19.
//  Copyright © 2019 Osama Gamal. All rights reserved.
//

import UIKit

class CartVC: UIViewController {
    @IBOutlet weak var itemsTableView: UITableView!
    @IBOutlet weak var subTotalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemsTableView.registerCellNib(cellClass: CartCell.self)
        subTotalLabel.text = "\(CartManager.shared.cartTotal)"
    }
    
    @IBAction func checkoutButtonPressed(_ sender: Any) {
        // send request to API :
        let items = CartManager.shared.items
        NetworkClient.performRequest([Resturant].self, router: .PlaceOrder(items: items), success: { (model) in
            print(model)
        }) { (error) in
            print("error placing an Order : \(error)")
        }
        
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
