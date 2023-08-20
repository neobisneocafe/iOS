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
