//
//  NetworkClient.swift
//  FoodDelivery
//
//  Created by Osama on 10/28/19.
//  Copyright © 2019 Osama Gamal. All rights reserved.
//

import Foundation
import Alamofire


class NetworkClient {
    
    typealias onSuccess<T> = ( (T, String) -> ())
    typealias onFailure = ((_ error: Error) -> ())
    
    static func performRequest<T>(_ object: T.Type, router: APIRouter, success: @escaping onSuccess<T>, failure: @escaping onFailure) where T:Decodable {
        Alamofire.request(router).responseJSON { (response) in
            // ALAMOFIRE ERROR CHECK
//            response.response?.statusCode
            if let error = response.error{
                failure(error)
                return
            }
            // PROCESS..
            do {
                let data = try JSONDecoder().decode(AppModel<T>.self, from: response.data!)
                if(data.status == .fail){
                    failure(BaseError.other(text: data.message ?? ""))
                    return
                } else {
                    if let datax = data.data {
                        success(datax, data.message ?? "No Message")
                    }
                }
            } catch let error{
                failure(error)
            }
        }
    }
    
}
