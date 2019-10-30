//
//  OrderItems.swift
//  FoodDelivery
//
//  Created by Kerolles Roshdi on 10/30/19.
//  Copyright © 2019 Osama Gamal. All rights reserved.
//

import Foundation

struct Order: Codable {
    let items: [ResturantFood]?
}
