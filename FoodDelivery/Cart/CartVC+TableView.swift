//
//  CartVC+TableView.swift
//  FoodDelivery
//
//  Created by admin on 10/30/19.
//  Copyright © 2019 Osama Gamal. All rights reserved.
//

import UIKit

extension CartVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CartManager.shared.items.count
//        return CartManager.shared.itemsSet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue() as CartCell
        let item = CartManager.shared.items[indexPath.row]
//        let item = CartManager.shared.itemsArray[indexPath.row]
        cell.configureCellWith(item: item)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        return footerView
    }
    
}
