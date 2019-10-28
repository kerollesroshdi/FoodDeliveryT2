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
    
    var method: HTTPMethod {
        switch self {
        case .Home:
            return .get
        case .RestData:
            return .get
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .Home:
            return nil
        case .RestData(let id):
            return ["id": id]
        }
    }
    
    var path: String {
        switch self{
        case .Home :
            return "Home"
        case .RestData:
            return "RestTypes"
        }
    }
    
    var encoding: ParameterEncoding{
        switch self{
        case .Home :
            return URLEncoding.default
            
        case .RestData:
            return URLEncoding.default
        }

    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.baseURL.asURL().appendingPathComponent(path)
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        // Common Headers
        request.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)

        
        if let parameters = parameters {
            return try encoding.encode(request, with: parameters)
        }
        
        return request
    }
    
}
