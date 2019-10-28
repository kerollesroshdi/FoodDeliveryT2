//
//  ErrorsModel.swift
//  FoodDelivery
//
//  Created by Osama on 10/28/19.
//  Copyright © 2019 Osama Gamal. All rights reserved.
//

import Foundation

struct AppModel<T: Decodable>: Decodable {
    var status: statusEnum?
    var data: T?
    var message: String?
    
    enum statusEnum: String, Decodable {
        case fail = "fail"
        case success = "success"
    }
}
