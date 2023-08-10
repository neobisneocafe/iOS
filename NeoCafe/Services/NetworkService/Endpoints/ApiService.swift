//
//  ApiService.swift
//  NeoCafe
//
//  Created by Adinay on 17/7/23.
//

import Foundation

enum ApiService: BaseRouterProtocol {
    case postRegisterUser(user: Data)
    case postActiveToken(phoneNumber: String, codeToConfirm: String)
    case postAuthorizationUser(auth: Data)
    case postAuthVerificationCode(code: String)
    case requestAccessToken(info: Data)
    case getBranches
    case getDishes
    case сhangePassword(firstName:String, phoneNumber: String)
    
    var path: String {
        switch self {
        case .postRegisterUser:
            return "/api/auth/signup"
            
        case .postActiveToken:
            return "/api/auth/confirm"
            
        case .postAuthorizationUser:
            return "/api/auth/login/send-verification-code"
            
            
        case .postAuthVerificationCode:
            return "/api/auth/login/verify"
            
        case .requestAccessToken:
            return "/api/auth/refresh"
            
            
        case .getBranches:
            return "/api/branch"
            
        case .getDishes:
            return "/api/dishes/list"
            
        case .сhangePassword:
            return "/api/user/update/profile"
        }
    }
    
    var method: HttpMethod {
        switch self {
        case .postRegisterUser:
            return .POST
        case .postActiveToken:
            return .POST
        case .postAuthorizationUser:
            return .POST
        case .postAuthVerificationCode:
            return .POST
        case .requestAccessToken:
            return .POST
        case .getBranches:
            return .GET
        case .getDishes:
            return .GET
        case .сhangePassword:
            return .PATCH
        }
    }
    
    var parametrs: [URLQueryItem]? {
        switch self {
        case.postActiveToken(phoneNumber: let phoneNumber, codeToConfirm: let codeToConfirm):
            return [URLQueryItem(name: "phoneNumber", value: phoneNumber), URLQueryItem(name: "codeToConfirm", value: codeToConfirm)]
            //        case.postActiveToken(codeToConfirm: let token):
            //            return [URLQueryItem(name: "phoneNumber", "codeToConfirm", value: token)]
            //
                    case .postAuthVerificationCode(let token):
                        return [URLQueryItem(name: "verificationCode", value: token)]
        default: return nil
        }
    }
    
    var httpBody: Data? {
        switch self {
        case .postRegisterUser(let user):
            return user
            
        case let .postActiveToken(phone, code):
            return [
                "phoneNumber": phone,
                "code": code
            ].toData()

            
        case .postAuthorizationUser(let auth):
            return auth
            
        case .postAuthVerificationCode(let code):
            return [
                "verificationCode": code
            ].toData()
            
        case .requestAccessToken(let info):
            return info
            
        case .getBranches:
            return nil
            
        case .getDishes:
            return nil
        case .сhangePassword(let firstName, let phoneNumber):
            return [
                "firstName": firstName,
                "phoneNumber": phoneNumber
            ].toData()
        }
    }
    
    
    var httpHeaders: [HttpHeader]? {
        switch self {
//        case .сhangePassword:
//            return [HttpHeader(field: "Authorization", value: "Bearer \(DSGenerator.sharedInstance.getAccessToken()!)")]
            
        default: return nil
        }
    }
}
