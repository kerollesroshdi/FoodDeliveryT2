//
//  Home.swift
//  FoodDelivery
//
//  Created by Osama on 10/28/19.
//  Copyright © 2019 Osama Gamal. All rights reserved.
//

import Foundation

// MARK: - Home
struct Home: Codable {
    let title: String?
    var types: [CircleModel]?
}

// MARK: - TypeElement
struct CircleModel: Codable {
    let id: Int?
    let image: String?
    let title: String?
    var isSelected: Bool? = false
}
