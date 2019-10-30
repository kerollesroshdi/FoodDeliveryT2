//
//  ResturantFood.swift
//  FoodDelivery
//
//  Created by Osama on 10/29/19.
//  Copyright © 2019 Osama Gamal. All rights reserved.
//

import Foundation

struct ResturantFood: Codable {
    let id: Int?
    let title: String?
    let image: String?
    let price: Int?
    let currency: String?
    var quantity: Int?
    
    func formattedPrice() -> String {
        return "\(price ?? 0) \(currency ?? "")"
    }
    
    func formatedTotalPrice() -> String {
        return "\(currency ?? "") \((price ?? 0) * (quantity ?? 0))"
    }
    
}

extension ResturantFood: Equatable {
    static func ==(lhs: ResturantFood, rhs: ResturantFood) -> Bool {
        return lhs.id == rhs.id
    }
}
