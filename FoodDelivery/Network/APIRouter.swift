//
//  APIRouter.swift
//  FoodDelivery
//
//  Created by Osama on 10/28/19.
//  Copyright © 2019 Osama Gamal. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case Home
    case RestData(id: Int)
    case RestFood(id: Int)
    case PlaceOrder(order: Order)
    
    var method: HTTPMethod {
        switch self {
        case .Home, .RestData, .RestFood:
            return .get
        case .PlaceOrder:
            return .post
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .RestData(let id):
            return ["id": id]
        case .RestFood(let id):
            return ["id": id]
        default:
            return nil
        }
    }
    
    var body: Data? {
        switch self {
        case .PlaceOrder(let order):
            do {
                return try JSONEncoder().encode(order)
            } catch let error {
                print("Error encoding order:", error)
                return nil
            }
        default:
            return nil
        }
    }
    
    var path: String {
        switch self{
        case .Home :
            return "Home"
        case .RestData:
            return "RestTypes"
        case .RestFood:
            return "Rest"
        case .PlaceOrder:
            return "PlaceOrder"
        }
    }
    
    var encoding: ParameterEncoding{
        switch self{
        default:
            return URLEncoding.default
        }

    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.baseURL.asURL().appendingPathComponent(path)
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = body
        
        // Common Headers
        request.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)

        
        if let parameters = parameters {
            return try encoding.encode(request, with: parameters)
        }
        
        return request
    }
    
}
