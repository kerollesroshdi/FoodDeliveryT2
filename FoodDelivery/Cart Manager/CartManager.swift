//
//  CartManager.swift
//  FoodDelivery
//
//  Created by Osama on 10/29/19.
//  Copyright © 2019 Osama Gamal. All rights reserved.
//

import Foundation

class CartManager {
    var items = [ResturantFood]()
    
    static let shared = CartManager()
//    private func isArrayEmpty(_ product:ResturantFood?) -> Bool{
//        return
//    }
    
    func add(_ product: ResturantFood?){
        guard let product = product else { return }
        guard items.isEmpty == false else {
            var myProduct = product
            myProduct.quantity = 1
            self.items.append(myProduct)
            return
        }
        for (index, item) in items.enumerated() {
            if(item == product){
                self.items[index].quantity = (self.items[index].quantity ?? 0) + 1
                return
            } else {
                var myProduct = product
                myProduct.quantity = 1
                self.items.append(myProduct)
                return
            }

        }
    }
    
    func remove(_ product: ResturantFood?){
        guard let product = product else { return }
        _ = items.enumerated().map { (index, item) in
            if(item == product){
                self.items[index].quantity = (self.items[index].quantity ?? 1) - 1
                if(self.items[index].quantity == 0){
                    self.items.remove(at: index)
                }
            }
        }
    }
    
    var totalItems: Int {
        return items.count ?? 0
    }
    
    var cartTotal: Int {
        var total: Int = 0
        items.map({ total += (($0.price ?? 0) * ($0.quantity ?? 0)) ?? 0 })
        return total
    }
    
}
