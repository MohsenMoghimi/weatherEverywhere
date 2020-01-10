//
//  URLRequestConvertible.swift
//  WeatherEverywhere
//
//  Created by Mohsen Moghimi on 10/2/19.
//  Copyright © 2019 Mohsen Moghimi. All rights reserved.
//

import Foundation

public enum HTTPMethod: String {
    case get     = "GET"
    case put     = "PUT"
    case post    = "POST"
    case delete  = "DELETE"
    case head    = "HEAD"
    case options = "OPTIONS"
    case trace   = "TRACE"
    case connect = "CONNECT"
}

protocol URLRequestConvertible {
    var url: URL { get }
    var method: HTTPMethod { get }
    var parameters: [String : String] { get }
    var bodyData: Data? { get }
    func request() -> URLRequest
}
