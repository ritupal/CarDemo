//
//  APIHandler.swift
//  CarDemo
//
//  Created by Kumari Ritu Pal on 29/07/22.
//

import Foundation

// MARK: APIHandler

public enum HTTPMethod: String {
    case get = "GET"
// we can use other methods also like post, put, delete etc.
}

protocol RequestHandler {
    associatedtype RequestDataType
    func makeRequest(from data: RequestDataType) -> URLRequest?
}

protocol ResponseHandler {
    associatedtype ResponseDataType
    func parseResponse(data: Data, response: HTTPURLResponse) throws -> ResponseDataType
}

typealias APIHandler = RequestHandler & ResponseHandler
