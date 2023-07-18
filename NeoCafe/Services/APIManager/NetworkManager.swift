//
//  NetworkManager.swift
//  NeoCafe
//
//  Created by Adinay on 17/7/23.
//

import Foundation
import Alamofire

class NetworkManager {
//    static let shared = NetworkManager()
    
    func performRequest<T: Decodable>(urlRequest: URLRequest, successModel: T.Type, completion: @escaping (ProResult<T>) -> Void) {
        AF.request(urlRequest).responseDecodable(of: successModel.self) { response in
            switch response.result {
            case .success(let decodedModel):
                completion(.success(decodedModel))
            case .failure(let error):
                if response.response?.statusCode == 400 {
                    let jsonData = response.data?.description.data(using: .utf8)
                    guard jsonData != nil else { return }
                    print(String(data: response.data!, encoding: .utf8)!)
                    completion(.badrequest("Bad request"))
                } else if response.response?.statusCode == StatusCode.unauthorized.rawValue {
                    completion(.unauthorized("Access token is dead"))
                    // Fetch new access token
                } else {
                    completion(.failerror(error.localizedDescription))
                }
            }
        }
    }
    
    
    func sendRequest(urlRequest: URLRequest, completion: @escaping(ProResult<Any>) -> Void ) {
        AF.request(urlRequest).responseString { response in
            switch response.result {
            case .success(let sucessModel):
                completion(.success(sucessModel))
            case .failure(let error):
                if response.response?.statusCode == 400 {
                    
                    completion(.badrequest(error.localizedDescription))
                } else if response.response?.statusCode == StatusCode.unauthorized.rawValue {
                    completion(.unauthorized(error.localizedDescription))
                    // Fetch new access token
                } else {
                    completion(.failerror(error.localizedDescription))
                }
            }
        }
    }
    
    private func decodeJson<T: Decodable>(data: Data?, decodeModel: T.Type) ->T? {
        guard let data = data else {
            return nil
        }
        return try? JSONDecoder().decode(T.self, from: data)
    }
    private func bazaDateError(data: Data?, response: URLResponse?, error: Error?) -> Error? {
        if let error = error {
            return error
        }
        
        guard let response = response as? HTTPURLResponse else {
            return URLError (.badServerResponse)
        }

        switch response.statusCode {
            case 200...210: return nil
            case 401:
                return NetworkErrors.unauthorized
            case StatusCode.badRequest.rawValue:
                return NetworkErrors.badRequest
            case StatusCode.forbidden.rawValue:
                return NetworkErrors.forbidden
            default:
                return nil
        }

    }
}

