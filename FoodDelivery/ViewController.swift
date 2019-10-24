//
//  ViewController.swift
//  FoodDelivery
//
//  Created by Osama on 10/24/19.
//  Copyright © 2019 Osama Gamal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        registerCells()
        // Do any additional setup after loading the view.
    }
    
    func registerCells(){
        tableView.registerHeaderNib(cellClass: CityHeaderCell.self)
        tableView.registerCellNib(cellClass: RestTypesCell.self)
        
        tableView.registerHeaderNib(cellClass: ResturantsHeaderCell.self)
        tableView.registerCellNib(cellClass: ResturantCell.self)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print(scrollView.contentOffset.y)
        if let header = tableView.headerView(forSection: 0) {
            let headerOffset = tableView.rectForRow(at: IndexPath(row: 0, section: 0))
            let mySecondOffset = headerOffset.origin.y
            let offset = 1 - (scrollView.contentOffset.y / mySecondOffset)
            header.alpha = offset
            print(offset)

        }
    }


}
