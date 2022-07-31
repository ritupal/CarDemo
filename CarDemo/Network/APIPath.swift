//
//  APIPath.swift
//  CarDemo
//
//  Created by Kumari Ritu Pal on 29/07/22.
//

import Foundation

#if DEBUG
let environment = APIEnvironment.development
#else
let environment = APIEnvironment.production
#endif

let baseURL = environment.baseUrl()

struct APIPath {
    var cars: String { return "\(baseURL)/cars"}

}
