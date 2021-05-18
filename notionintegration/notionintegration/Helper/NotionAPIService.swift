//
//  NotionAPIService.swift
//  notionintegration
//
//  Created by Maegan Wilson on 5/16/21.
//

import Foundation

// https://www.notion.so/mywheels/57badff019054566aeec263b157c3b9f?v=a37a9d32d9e8410693cc874da83da26d
let databaseID = "57badff019054566aeec263b157c3b9f"

class NotionAPIService {
    public static let shared = NotionAPIService()
    private init(){}
    
    private let urlSession = URLSession(configuration: .ephemeral)
    private let baseURL = URL(string: "https://api.notion.com/v1")!
    
    private let jsonDecoder: JSONDecoder = {
        let jsonDecorder = JSONDecoder()
        return jsonDecorder
    }()
    
    private let jsonEncoder: JSONEncoder = {
        let jsonEncoder = JSONEncoder()
        return jsonEncoder
    }()
    
    enum Endpoint: String, CaseIterable {
        case databases
        case pages
        case block
        case search
    }
    
    public enum NotionAPIServiceError: Error {
        case apiError
        case invalidEndpoint
        case invalidResponse
        case noData
        case decodeError
        case encodeError
    }
    
    private func fetchResources<T: Decodable>(url: URL, completion: @escaping (Result<T, NotionAPIServiceError>) -> Void) {
        
        
        guard let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            completion(.failure(.invalidEndpoint))
            return
        }
        
//        let queryItems = [URLQueryItem(name: "limit", value: notionSecret)]
//        urlComponents.queryItems = queryItems
        
        guard let url = urlComponents.url else {
            completion(.failure(.invalidEndpoint))
            return
        }
        
        var request = URLRequest(url: url)
        request.setValue("Bearer \(notionSecret)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("2021-05-13", forHTTPHeaderField: "Notion-Version")
        request.httpMethod = "POST"
        
        urlSession.dataTask(with: request){ (result) in
            switch result {
            case .success(let (response, data)):
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= statusCode else {
                    completion(.failure(.invalidResponse))
                    return
                }
                do {
                    let values = try self.jsonDecoder.decode(T.self, from: data)
                    completion(.success(values))
                } catch {
                    completion(.failure(.decodeError))
                }
            case .failure(let error):
                print(error)
                completion(.failure(.apiError))
            }
        }.resume()
    }
    
    private func postResources<T: Decodable>(url: URL, databaseRow: NotionDBPage, completion: @escaping (Result<T, NotionAPIServiceError>) -> Void) {
        guard let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            completion(.failure(.invalidEndpoint))
            return
        }
        
        guard let requestURL = urlComponents.url else {
            completion(.failure(.invalidEndpoint))
            return
        }
        
        var request = URLRequest(url: requestURL)
        request.setValue("Bearer \(notionSecret)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("2021-05-13", forHTTPHeaderField: "Notion-Version")
        request.httpMethod = "POST"
        
        let data: Data
        
        do {
            data = try jsonEncoder.encode(databaseRow)
            request.httpBody = data
        } catch {
            completion(.failure(.encodeError))
        }
        print(databaseRow)
        
        urlSession.dataTask(with: request){ (result) in
            switch result{
            case .success(let (response, data)):
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= statusCode else {
//                    print(response)
                    print((response as? HTTPURLResponse)?.statusCode ?? 0)
                    let responseData = String(data: data, encoding: String.Encoding.utf8)
                    print(responseData as Any)
                    completion(.failure(.invalidResponse))
                    return
                }
                do {
                    let values = try self.jsonDecoder.decode(T.self, from: data)
                    completion(.success(values))
                } catch {
                    completion(.failure(.decodeError))
                }
            case .failure(let error):
                print(error)
                completion(.failure(.apiError))
            }
        }.resume()
    }
    
    public func add(info dbRow: NotionDBPage, to endpoint: Endpoint, result: @escaping (Result<NotionDB, NotionAPIServiceError>) -> Void){
        let url = baseURL.appendingPathComponent(endpoint.rawValue)
        postResources(url: url, databaseRow: dbRow, completion: result)
    }
}
