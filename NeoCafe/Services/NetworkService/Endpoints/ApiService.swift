//
//  ApiService.swift
//  NeoCafe
//
//  Created by Adinay on 17/7/23.
//

import Foundation

enum ApiService: BaseRouterProtocol {
case postRegisterUser(user: Data)
case postActiveToken(token: String)
case postAuthorizationUser(auth: Data)
    
    
    var path: String {
        switch self {
        case .postRegisterUser:
            return "/api/auth/signup"
        case .postActiveToken(let token):
            return "/api/auth/confirm"
        case .postAuthorizationUser(let auth):
            return "/api/auth/login/"
        }
    }
    
    var method: HttpMethod {
        switch self {
        case .postRegisterUser:
            return .POST
        case .postActiveToken(let token):
            return .POST
        case .postAuthorizationUser(let auth):
            return .POST
        }
    }
    
    var parametrs: [URLQueryItem]? {
        switch self {
        default: return nil
        }
    }
    
    var httpBody: Data? {
        switch self {
        case .postRegisterUser(let user):
            return user
        case .postActiveToken(let token):
            return nil
        case .postAuthorizationUser(let auth):
            return auth
        }
    }
    
    var httpHeaders: [HttpHeader]? {
        switch self {
        default: return nil
        }
    }
}
