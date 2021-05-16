//
//  URLSession+Extension.swift
//  notionintegration
//
//  Created by Maegan Wilson on 5/16/21.
//

import Foundation
extension URLSession {
    func dataTask(with url: URL, result: @escaping (Result<(URLResponse, Data), Error>) -> Void) -> URLSessionDataTask{ return dataTask(with: url) { (data, response, error) in
        if let error = error {
            result(.failure(error))
            return
        }
        
        guard let response = response, let data = data else {
            let error = NSError(domain: "error", code: 0, userInfo: nil)
            result(.failure(error))
            return
        }
        
        result(.success((response, data)))
    }
    
    }
    
    func dataTask(with request: URLRequest, result: @escaping (Result<(URLResponse, Data), Error>) -> Void) -> URLSessionDataTask { return dataTask(with: request) { (data, response, error) in
        
        if let error = error {
            result(.failure(error))
            return
        }
        
        guard let response = response, let data = data else {
            let error = NSError(domain: "error", code: 0, userInfo: nil)
            result(.failure(error))
            return
        }
        
        result(.success((response, data)))
    }
    }
}