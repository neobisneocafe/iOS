//
//  AuthViewModel.swift
//  NeoCafe
//
//  Created by Adinay on 17/7/23.
//

import Foundation

class AuthViewModel {
    func authUser(phoneNumber: String, completion: @escaping ()->Void) {
        let userData = ["phoneNumber": "\(phoneNumber)"].toData()
        NetworkManager().performRequest(urlRequest: ApiService.postAuthorizationUser(auth: userData).makeUrlRequest(), successModel: AuthorizationDTO.self) { result in
            switch result {
            case .success(let model):
                print(model)
                completion() // Вызов обработчика завершения после успешной регистрации
            case .failerror(let error):
                print(error)
            case .unauthorized(let string):
                print(string)
            case .forebidden(let string):
                print(string)
            case .notfound(let string):
                print(string)
            case .badrequest(let string):
                print(string)
            }
        }
    }
}
