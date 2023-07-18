//
//  BaseRouter.swift
//  NeoCafe
//
//  Created by Adinay on 17/7/23.
//

import Foundation

protocol BaseRouterProtocol {
    var path: String { get }
    var method: HttpMethod { get }
    var parametrs: [URLQueryItem]? { get }
    var httpBody: Data? { get }
    var httpHeaders: [HttpHeader]? { get }
}

extension BaseRouterProtocol {
    var host: String   { return "neo-cafe-neobis-d301ec8e3f9a.herokuapp.com" }
    var skim: String { return "https" }
    
    func makeUrlRequest() -> URLRequest {
        var components =  URLComponents()
        components.path = path
        components.host = host
        components.scheme = skim
        components.queryItems = parametrs
        guard let url = components.url else {
            fatalError(URLError(.unsupportedURL).localizedDescription)
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.httpBody = httpBody
        httpHeaders?.forEach({ (header) in
            urlRequest.setValue(header.value, forHTTPHeaderField: header.field)
        })
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
                urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        
        return urlRequest
    }
}
