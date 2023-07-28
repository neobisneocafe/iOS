//
//  RegisterVerificationViewModel.swift
//  NeoCafe
//
//  Created by Adinay on 17/7/23.
//

import Foundation

class RegisterVerificationViewModel {
    func registerVerification(phoneNumber: String, codeToConfirm: String, completion: @escaping (String) -> Void) {
        NetworkManager().performRequest(
            urlRequest: ApiService.postActiveToken(phoneNumber: phoneNumber,codeToConfirm: codeToConfirm).makeUrlRequest(),
            successModel: AccessTokenResponse.self
        ) { result in
            switch result {
            case .success(let response):
                completion(response.accessToken ?? "")
                
            default:
                break
            }
        }
    }
}
