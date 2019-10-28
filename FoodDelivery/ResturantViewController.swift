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
    
    @IBOutlet weak var navTitle: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerHeaderNib(cellClass: RestDetailsHeader.self)
        tableView.registerCellNib(cellClass: FoodItemCell.self)
        tableView.separatorStyle = .none
        // Do any additional setup after loading the view.
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let header = tableView.headerView(forSection: 0) {
            let headerOffset = tableView.rectForHeader(inSection: 0)
            let mySecondOffset = headerOffset.height / 2
            let offset = 1 - ((scrollView.contentOffset.y - mySecondOffset) / mySecondOffset)
            header.alpha = offset
            navTitle.alpha = 1 - offset
            print(offset)
        }
    }
    


}


