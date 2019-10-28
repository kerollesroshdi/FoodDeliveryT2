//
//  ViewController.swift
//  FoodDelivery
//
//  Created by Osama on 10/24/19.
//  Copyright © 2019 Osama Gamal. All rights reserved.
//

import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if(section == 0){
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CityHeaderCell") as! CityHeaderCell
        print("table \(header.bounds)")
        
        return header
        } else {
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ResturantsHeaderCell") as! ResturantsHeaderCell
            print("table \(header.bounds)")
            return header
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if(section == 0){
            return 60
        } else {
            return 100
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section == 0){
            let item = self.data?.types
            let cell = tableView.dequeue() as RestTypesCell
            cell.items = item
            cell.didSelectItem = { [weak self] item in
                self?.didSelectItem(item)
            }
            return cell
        } else {
            let item = self.Resturants?[indexPath.row]
            let cell = tableView.dequeue() as ResturantCell
            cell.configure(item)
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return 1
        } else {
            return Resturants?.count ?? 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
}
