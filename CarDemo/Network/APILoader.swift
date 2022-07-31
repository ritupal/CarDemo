//
//  APILoader.swift
//  CarDemo
//
//  Created by Kumari Ritu Pal on 29/07/22.
//

import Foundation

/// This is used to hit the api on the server using urlsession
struct APILoader<T: APIHandler> {
    var apiHandler: T
    var session: URLSession
    
    init(apiHandler: T, urlSession: URLSession = .shared) {
        self.apiHandler = apiHandler
        self.session = urlSession
    }
    
    func loadAPIRequest(requestData: T.RequestDataType, completionHandler: @escaping (T.ResponseDataType?, ServiceError?) -> ()) {
        if let request = apiHandler.makeRequest(from: requestData) {
            session.dataTask(with: request) { (data, response, error) in
                if let httpResponse = response as? HTTPURLResponse {
                    let serviceError = ServiceError(httpStatus: httpResponse.statusCode, message: "Service Error \(error?.localizedDescription ?? "Unknown error")")
                    guard error == nil else {
                        completionHandler(nil, serviceError)
                        return
                    }
                    guard let responseData = data else {
                        completionHandler(nil, serviceError)
                        return
                    }
                    do {
                        let parsedResponse = try self.apiHandler.parseResponse(data: responseData, response: httpResponse)
                        completionHandler(parsedResponse, nil)
                    } catch {
                        completionHandler(nil, serviceError)
                    }
                }
            }.resume()
        }
    }
}
