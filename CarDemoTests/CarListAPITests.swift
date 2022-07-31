//
//  CarListAPITest.swift
//  CarDemoTests
//
//  Created by Kumari Ritu Pal on 31/07/22.
//

import Foundation
import XCTest
@testable import CarDemo


class CarListAPITests: XCTestCase  {
    func test_api_for_request() {
        let api = CarListAPI()
        let request = api.makeRequest()
        
        XCTAssertNotNil(request)
        XCTAssertNotNil(request?.url)
        XCTAssertEqual(request?.url?.scheme, "https")
        XCTAssertEqual(request?.url?.host, "cdn.sixt.io")
    }
    
    func test_api_for_parsing_logic() {
        let api = CarListAPI()
        let data = [["id" : "WMWSW31030T222518", "name": "Vanessa", "make": "BMW", "fuelType" : "D", "licensePlate": "M-VO0259",  "carImageUrl": "https://cdn.sixt.io/codingtask/images/mini.png"]]
        let encoder = JSONEncoder()
        if let jsonData = try? encoder.encode(data),
           let url = URL(string: APIPath().cars),
           let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: "", headerFields: nil) {
            
            let response = try? api.parseResponse(data: jsonData, response: response)
            XCTAssertEqual(response?.count, 1)
        }
        
    }
}
