//
//  AuthVerificationViewModel.swift
//  NeoCafe
//
//  Created by Adinay on 18/7/23.
//

import Foundation

class AuthVerificationViewModel {
    
    var code = ""
    func authVerification(verificationCode: String, completion: @escaping (String) -> Void) {
        NetworkManager().sendRequest(urlRequest: ApiService.postAuthVerificationCode(code: code).makeUrlRequest()) { response
            in
            switch response {
            case .success(let string):
                debugPrint(string)
                self.code = string
                completion(string)
            case .unauthorized(let string):
                debugPrint(string)
            case .forbidden(let string):
                debugPrint(string)
            case .notfound(let string):
                debugPrint(string)
            case .badrequest(let string):
                debugPrint(string)
            case .failure(let string):
                debugPrint(string)
            }
        }
    }
}

    
//    var code = ""
//    func authorizationUser(codeToConfirm: String, completion: @escaping () -> Void) {
//        let data = ["codeToConfirm": codeToConfirm]
//        let urlRequest = ApiService.postAuthVerificationCode(token: data).makeUrlRequest()
//        NetworkManager().performRequest(urlRequest: urlRequest, successModel: LoginResponse.self)                     { result in
//            switch result {
//            case .success(let model):
//                print(model)
//                completion()
//            case .unauthorized(let string):
//                print(string)
//            case .forbidden(let string):
//                print(string)
//            case .notfound(let string):
//                print(string)
//            case .badrequest(let string):
//                print(string)
//            case .failerror(let string):
//                print(string)
//            }
//        }
//    }
//
//}




//class AuthVerificationViewModel {
//
//    var code = ""
//    func authorizationUser(codeToConfirm: String, completion: @escaping (String)->Void) {
//        let data = ["codeToConfirm": "\(codeToConfirm)"].toData()
//        NetworkManager().performRequest(urlRequest: ApiService.postAuthVerificationCode(token: data).makeUrlRequest(), successModel: LoginResponse.self) { result in
//            switch result {
//            case .success(let string):
//                print(string)
////                DSGenerator.sharedInstance.setAccessToken(model.accessToken)
////                DSGenerator.sharedInstance.setRefreshToken(model.refreshToken)
//                completion(string)
//            case .unauthorized(let string):
//                print(string)
//            case .forebidden(let string):
//                print(string)
//            case .notfound(let string):
//                print(string)
//            case .badrequest(let string):
//                print(string)
//            case .failerror(let string):
//                print(string)
//            }
//        }
//    }

    
    
    //func authorizationUser(email: String, password: String, completion: @escaping ()->Void) {
    //    let data = ["email": "\(email)",
    //                "password": "\(password)"].toData()
    //    NetworkManager().sendRequest(urlRequest: ApiService.loginUser(user: data).makeUrlRequest(), successModel: LoginResponse.self) { result in
    //        switch result {
    //        case .success(let model):
    //            print(model)
    //            DSGenerator.sharedInstance.setAccessToken(model.accessToken)
    //            DSGenerator.sharedInstance.setRefreshToken(model.refreshToken)
    //            completion()
    //        case .unauthorized(let string):
    //            print(string)
    //        case .forebidden(let string):
    //            print(string)
    //        case .notfound(let string):
    //            print(string)
    //        case .badrequest(let string):
    //            print(string)
    //        case .failerror(let string):
    //            print(string)
    //        }
    //    }
    //}

    
    
    
    
 
