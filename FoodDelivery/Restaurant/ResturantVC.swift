//
//  ResturantViewController.swift
//  FoodDelivery
//
//  Created by Osama on 10/27/19.
//  Copyright © 2019 Osama Gamal. All rights reserved.
//

import UIKit

class ResturantVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navTitle: UILabel!
    @IBOutlet weak var restaurantHeaderImage: UIImageView!
    
    var data: Resturant?
    var foodData: [ResturantFood]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerHeaderNib(cellClass: RestDetailsHeader.self)
        tableView.registerCellNib(cellClass: FoodItemCell.self)
        tableView.separatorStyle = .none
        tableView.layer.cornerRadius = 10
        tableView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        navTitle.text = data?.title
        restaurantHeaderImage.kf.setImage(with: URL(string: (data?.image)!))
        loadDataForResturant(data)
        // Do any additional setup after loading the view.
    }
    
    func loadDataForResturant(_ rest: Resturant?){
        guard let id = rest?.id else { return }
        NetworkClient.performRequest([ResturantFood].self, router: .RestFood(id: id), success: { models, message  in
            self.foodData = models
            self.tableView.reloadSections(IndexSet(integersIn: 1...1), with: .left)
        }) { (error) in
            print(error)
        }
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
    
    @IBAction func didPressBack(_ sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func edgePanned(_ sender: Any) {
        print("restaurantVC Edge Panned")
        self.navigationController?.popViewController(animated: true)
    }
    
}


