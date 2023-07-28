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
        NetworkManager().performRequest(urlRequest: ApiService.postAuthVerificationCode(code: verificationCode).makeUrlRequest(), successModel: RefreshToken.self) { result in
            switch result {
            case .success(let response):
                // Сохраняем токены в хранилище данных UserDefaults
                DataStoreUserDefaults.shared.setAccessToken(response.accessToken)
                DataStoreUserDefaults.shared.setRefreshToken(response.refreshToken)
                // Возвращаем токены в качестве результата
                completion(response.accessToken ?? "")
                completion(response.refreshToken ?? "")
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






//class AuthVerificationViewModel {
//
//    var code = ""
//    func authVerification(verificationCode: String, completion: @escaping (String) -> Void) {
//        NetworkManager().performRequest(urlRequest: ApiService.postAuthVerificationCode(code: verificationCode).makeUrlRequest(), successModel: RefreshToken.self) { result in
//            switch result {
//            case .success(let response):
////                DataStoreUserDefaults.shared.setAccessToken(response.accessToken)
////                DataStoreUserDefaults.shared.setRefreshToken(response.refreshToken)
//
//                self.code = response.accessToken ?? ""
//                self.code = response.refreshToken ?? ""
//                completion(response.accessToken ?? "")
//                completion(response.refreshToken ?? "")
//            case .unauthorized(let string):
//                debugPrint(string)
//            case .forbidden(let string):
//                debugPrint(string)
//            case .notfound(let string):
//                debugPrint(string)
//            case .badrequest(let string):
//                debugPrint(string)
//            case .failure(let string):
//                debugPrint(string)
//            }
//        }
//    }
//}




//class AuthVerificationViewModel {
//
//    var code = ""
//    func authVerification(verificationCode: String, completion: @escaping (String) -> Void) {
//        NetworkManager().sendRequest(urlRequest: ApiService.postAuthVerificationCode(code: code).makeUrlRequest()) { response
//            in
//            switch response {
//            case .success(let model):
//                debugPrint(model)
//                DSGenerator.sharedInstance.setAccessToken(model.accessTokenn)
//                DSGenerator.sharedInstance.setRefreshToken(model.refreshToken)
//                self.code = model
//                completion()
//            case .unauthorized(let string):
//                debugPrint(string)
//            case .forbidden(let string):
//                debugPrint(string)
//            case .notfound(let string):
//                debugPrint(string)
//            case .badrequest(let string):
//                debugPrint(string)
//            case .failure(let string):
//                debugPrint(string)
//            }
//        }
//    }
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
