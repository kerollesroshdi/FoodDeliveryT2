//
//  HomeVC.swift
//  FoodDelivery
//
//  Created by Osama on 10/24/19.
//  Copyright © 2019 Osama Gamal. All rights reserved.
//

import UIKit
import Alamofire
import Toast_Swift

class HomeVC: UIViewController {
    var Resturants: [Resturant]?
    var data: Home?
    @IBOutlet weak var tableView: UITableView!
    
    public enum HomeSections: CaseIterable {
        case topItems
        case restData
    }

    func displayError(_ text: String){
        
        let alert = UIAlertController(title: text, message: text, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "done", style: .default, handler: nil)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        registerCells()
        getTopData()
        if(traitCollection.forceTouchCapability == .available){
            registerForPreviewing(with: self, sourceView: tableView)
        }
        

        // Do any additional setup after loading the view.
    }
    
    func registerCells(){
        tableView.registerHeaderNib(cellClass: CityHeaderCell.self)
        tableView.registerCellNib(cellClass: RestTypesCell.self)
        
        tableView.registerHeaderNib(cellClass: ResturantsHeaderCell.self)
        tableView.registerCellNib(cellClass: ResturantCell.self)
    }
    
    
    func getTopData(){
        self.view.makeToastActivity(.center)
        NetworkClient.performRequest(Home.self, router: .Home, success: { (models, message) in
            self.view.hideToastActivity()
            self.data = models
            self.loadFirstData()
            self.tableView.reloadData()
        }) { (error) in
            self.view.hideToastActivity()
            guard let error = error as? BaseError else { return }
            if case .other(let error) = error {
                //                self.displayError(error )
            } else {
                //                self.displayError(error.MyDescription)
            }
            
        }
    }
    
    func loadFirstData(){
        if let firstItem = self.data?.types?.first {
            self.getResturantData(for: firstItem)
            self.data?.types?[0].isSelected = true
//            firstItem.isSelected = true
            if let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? RestTypesCell{
                cell.collectionView.reloadData()
            }
        }

    }

    
    func didSelectItem(_ item: CircleModel){
        getResturantData(for: item)
    }
    
    private func getResturantData(for restType: CircleModel){
        guard let id = restType.id else { return }
        self.view.makeToastActivity(.center)
        NetworkClient.performRequest([Resturant].self, router: .RestData(id: id), success: { (models, message) in
            self.view.hideToastActivity()
            self.Resturants = models
            self.tableView.reloadSections(IndexSet(integersIn: 1...1), with: .left)
            print(models)
        }) { (error) in
            self.view.hideToastActivity()
            self.displayError(error.localizedDescription)
        }
    }
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let header = tableView.headerView(forSection: 0) {
            let headerOffset = tableView.rectForRow(at: IndexPath(row: 0, section: 0))
            let mySecondOffset = headerOffset.origin.y
            let offset = 1 - (scrollView.contentOffset.y / mySecondOffset)
            header.alpha = offset
        }
        
        if let header = tableView.headerView(forSection: 1) as? ResturantsHeaderCell {
            let headerOffset = tableView.rectForRow(at: IndexPath(row: 0, section: 1))
            let headerOffsetY = headerOffset.origin.y
            let offset = (scrollView.contentOffset.y / headerOffsetY)
            header.containerView.cornerRadius = 20 * (1 - offset)
            //            print(offset)
            if(offset >= 1) {
                tableView.backgroundColor = .white
            } else {
                tableView.backgroundColor = .clear
            }
        }
        
    }


}
