//
//  ResturantViewController.swift
//  FoodDelivery
//
//  Created by Osama on 10/27/19.
//  Copyright © 2019 Osama Gamal. All rights reserved.
//

import UIKit

extension ResturantVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "RestDetailsHeader") as! RestDetailsHeader
            cell.titleLbl.text = data?.title
            cell.deliveryTimeLabel.text = data?.deliveryTime
            cell.ratingLabel.text = "\(data?.rating ?? 0.0)"
            cell.rateCountLabel.text = "\(data?.ratingCount ?? 0)"
            cell.items = data?.genres ?? []
            return cell
        } else {
            let cell = UITableViewHeaderFooterView()
            cell.textLabel?.text = "Picked for you"
            cell.contentView.backgroundColor = .white
            cell.layer.masksToBounds = true
            cell.layer.cornerRadius = 10
//            cell.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if(section == 0){
            return 160
        } else {
            return 40
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = self.foodData?[indexPath.row]
        let cell = tableView.dequeue() as FoodItemCell
        cell.configure(item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return 0
        } else {
            return foodData?.count ?? 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
}


