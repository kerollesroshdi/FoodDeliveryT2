//
//  ViewController.swift
//  FoodDelivery
//
//  Created by Osama on 10/24/19.
//  Copyright © 2019 Osama Gamal. All rights reserved.
//

import UIKit
import SkeletonView

extension ViewController: UITableViewDelegate, SkeletonTableViewDataSource {


    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        if(indexPath.section == 0){
            return "RestTypesCell"
        } else {
            return "ResturantCell"
        }
    }
    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return 1
        }
        return 10
    }
    func numSections(in collectionSkeletonView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let section = HomeSections.allCases[section]
        switch section {
        case .topItems:
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CityHeaderCell") as! CityHeaderCell
        print("table \(header.bounds)")
        
        return header
        case .restData:
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ResturantsHeaderCell") as! ResturantsHeaderCell
            print("table \(header.bounds)")
            return header
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let section = HomeSections.allCases[section]
        switch section {
        case .topItems:
            return 60
        case .restData:
        return self.Resturants != nil ? 100 : 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = HomeSections.allCases[indexPath.section]
        if case .restData = section {
            let item = self.Resturants?[indexPath.row]
            let view = self.storyboard?.instantiateViewController(withIdentifier: "ResturantViewController") as! ResturantViewController
            view.data = item
            self.navigationController?.pushViewController(view, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = HomeSections.allCases[indexPath.section]
        switch section {
        case .topItems:
            let item = self.data?.types
            let cell = tableView.dequeue() as RestTypesCell
            cell.items = item
            
            cell.didSelectItem = { [weak self] item in
                self?.didSelectItem(item)
            }
            return cell
        case .restData:
            let item = self.Resturants?[indexPath.row]
            let cell = tableView.dequeue() as ResturantCell
            cell.configure(item)
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = HomeSections.allCases[section]
        switch section {
        case .topItems:
            return 1
        case .restData:
            return Resturants?.count ?? 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return HomeSections.allCases.count
    }
    
    
}
