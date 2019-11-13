//
//  ResturantCell.swift
//  FoodDelivery
//
//  Created by Osama on 10/24/19.
//  Copyright © 2019 Osama Gamal. All rights reserved.
//

import UIKit

protocol LoveRestaurantDelegate: class {
    func loveRestaurant(rest: Resturant)
    func disLoveRestaurant(rest: Resturant)
}

class ResturantCell: UITableViewCell {
    @IBOutlet weak var restTitle: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var delivertTimeLabel: UILabel!
    @IBOutlet weak var ratingCountLabel: UILabel!
    @IBOutlet weak var lovedButton: UIButton!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var FoodGenreCollectionView: UICollectionView!
    @IBOutlet weak var flow: UICollectionViewFlowLayout! {
        didSet {
            flow.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
    
    let genreFont = UIFont.systemFont(ofSize: 12, weight: .bold)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        FoodGenreCollectionView.delegate = self
        FoodGenreCollectionView.dataSource = self
        FoodGenreCollectionView.registerCellNib(cellClass: GenreCell.self)
        selectionStyle = .none
        
        // collectionView Constraints:
        FoodGenreCollectionView.translatesAutoresizingMaskIntoConstraints = false
        FoodGenreCollectionView.heightAnchor.constraint(equalToConstant: "GenreTextForHeight".heightOfString(usingFont: genreFont) + 22).isActive = true
        
    }
    
    var genres = [String]()
    var item: Resturant?
    
    func configure(_ item: Resturant?){
        guard let item = item else { return }
        self.item = item
        restTitle.text = item.title
        delivertTimeLabel.text = item.deliveryTime
        ratingLabel.text = "\(item.rating!)"
        ratingCountLabel.text = "\(item.ratingCount!)"
        lovedButton.imageView?.image = item.liked ?? false ?  #imageLiteral(resourceName: "liked") : #imageLiteral(resourceName: "like")
        
        if let image = item.image {
            img.kf.setImage(with: URL(string: image))
        }
        
        genres = item.genres ?? []
        
        if genres.count == 1 {
            let width = genres[0].widthOfString(usingFont: genreFont)
            FoodGenreCollectionView.widthAnchor.constraint(equalToConstant: width + 22).isActive = true
            ratingCountLabel.isHidden = false
        } else if genres.count == 2 {
            let width = genres[0...1].map{ $0.widthOfString(usingFont: genreFont) }.reduce(0, +)
            FoodGenreCollectionView.widthAnchor.constraint(equalToConstant: width + 34).isActive = true
            ratingCountLabel.isHidden = true
        } else if genres.count > 2 {
            let width = genres[0...2].map{ $0.widthOfString(usingFont: genreFont) }.reduce(0, +)
            FoodGenreCollectionView.widthAnchor.constraint(equalToConstant: width + 40).isActive = true
            ratingCountLabel.isHidden = true
        }
        FoodGenreCollectionView.reloadData()
    }
    
    func bgColor(_ color: UIColor) {
        self.backgroundColor = color
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
     weak var delegate: LoveRestaurantDelegate?
    
    @IBAction func LoveButtonPressed(_ sender: UIButton) {
        if self.item?.liked ?? false {
            print("Trying to dislove a restaurant")
            delegate?.disLoveRestaurant(rest: self.item!)
            LovedManager.shared.removeItem(self.item)
        } else {
            print("Trying to love a restaurant")
            delegate?.loveRestaurant(rest: self.item!)
            LovedManager.shared.addItem(self.item)
        }
        
    }
    
}

extension ResturantCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(indexPath: indexPath) as GenreCell
        cell.title.text = genres[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         let itemStringSize = genres[indexPath.row].sizeOfString(usingFont: genreFont)
               return CGSize(width: itemStringSize.width + 12, height: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genres.count
    }
}
