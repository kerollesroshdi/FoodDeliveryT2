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
    @IBOutlet weak var tabBar: CustomTabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        registerCells()
        tabBar.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func registerCells(){
        tableView.registerHeaderNib(cellClass: CityHeaderCell.self)
        tableView.registerCellNib(cellClass: RestTypesCell.self)
        
        tableView.registerHeaderNib(cellClass: ResturantsHeaderCell.self)
        tableView.registerCellNib(cellClass: ResturantCell.self)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let header = tableView.headerView(forSection: 0) {
            let headerOffset = tableView.rectForRow(at: IndexPath(row: 0, section: 0))
            let mySecondOffset = headerOffset.origin.y
            let offset = 1 - (scrollView.contentOffset.y / mySecondOffset)
            header.alpha = offset
        }
        
        if let header = tableView.headerView(forSection: 1) as? ResturantsHeaderCell{
            let headerOffset = tableView.rectForHeader(inSection: 1)
            let mySecondOffset = headerOffset.origin.y
            let offset = (scrollView.contentOffset.y / mySecondOffset)
            print(offset)

            if(offset >= 1) {
                header.containerView.layer.mask = nil
                tableView.backgroundColor = .white
            } else {
                header.containerView.layer.mask = header.cornerMask
                tableView.backgroundColor = .clear
            }
        }
    }


}
