//
//  RestDetailsHeader.swift
//  FoodDelivery
//
//  Created by Osama on 10/27/19.
//  Copyright © 2019 Osama Gamal. All rights reserved.
//

import UIKit

class RestDetailsHeader: UITableViewHeaderFooterView {
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var deliveryTimeLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var rateCountLabel: UILabel!
    var items: [String] = ["Burger", "American", "A"]
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerCellNib(cellClass: GenreCell.self)
    }

}
extension RestDetailsHeader: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.row]
        let cell = collectionView.dequeue(indexPath: indexPath) as GenreCell
        cell.title.text = item
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = items[indexPath.row]
        let size = item.size(withAttributes: [NSAttributedString.Key.font: titleLbl.font])

        return CGSize(width: size.width + 12, height: 30)
    }
    
    
    
}
