//
//  ResturantViewController.swift
//  FoodDelivery
//
//  Created by Osama on 10/27/19.
//  Copyright © 2019 Osama Gamal. All rights reserved.
//

import UIKit

class ResturantViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerHeaderNib(cellClass: RestDetailsHeader.self)
        tableView.registerCellNib(cellClass: FoodItemCell.self)
        tableView.separatorStyle = .none
        // Do any additional setup after loading the view.
    }

}


