//
//  CarService.swift
//  CarDemo
//
//  Created by Kumari Ritu Pal on 29/07/22.
//

import Foundation

struct CarListAPI: APIHandler {
    
    func makeRequest(from param: [String: Any] = [:]) -> URLRequest? {
        let urlString =  APIPath().cars
        if var url = URL(string: urlString) {
            if param.count > 0 {
                url = setQueryParams(parameters: param, url: url)
            }
            var urlRequest = URLRequest(url: url)
            setDefaultHeaders(request: &urlRequest)
            urlRequest.httpMethod = HTTPMethod.get.rawValue
            return urlRequest
        }
        return nil
    }
    
    func parseResponse(data: Data, response: HTTPURLResponse) throws -> [CarResponseModel] {
        return try defaultParseResponse(data: data,response: response)
    }
}

protocol CarServiceProtocol {
    func getCarList(param: [String: Any], completion: @escaping ([CarResponseModel]?, ServiceError?) -> ())
}

class CarService: CarServiceProtocol {
    func getCarList(param: [String: Any], completion: @escaping ([CarResponseModel]?, ServiceError?) -> ()){
        let request = CarListAPI()
        
        let apiLoader = APILoader(apiHandler: request)
        apiLoader.loadAPIRequest(requestData: param) { (model, error) in
            if let _ = error {
                completion(nil, error)
            } else {
                completion(model, nil)
            }
        }
    }
}
