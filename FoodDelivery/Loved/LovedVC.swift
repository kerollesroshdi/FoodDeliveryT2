//
//  LovedVC.swift
//  FoodDelivery
//
//  Created by admin on 11/13/19.
//  Copyright © 2019 Osama Gamal. All rights reserved.
//

import UIKit

class LovedVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var resturants = [Resturant]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerCellNib(cellClass: ResturantCell.self)
        tableView.backgroundColor = .clear
        resturants = LovedManager.shared.items
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        resturants = LovedManager.shared.items
        tableView.reloadData()
    }
    

}

extension LovedVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resturants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue() as ResturantCell
        let item = self.resturants[indexPath.row]
        cell.configure(item)
        cell.delegate = self
        cell.bgColor(.clear)
        return cell
    }
    
}

extension LovedVC: LoveRestaurantDelegate {
    func loveRestaurant(rest: Resturant) {
        //
    }
    
    func disLoveRestaurant(rest: Resturant) {
        if let row = resturants.firstIndex(where: { (restaurant) -> Bool in
            restaurant.id == rest.id
        }) {
            print("removing a restaurant from loved ...")
            resturants.remove(at: row)
            tableView.reloadData()
        }
    }
}
