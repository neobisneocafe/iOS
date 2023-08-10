//
//  AuthViewModel.swift
//  NeoCafe
//
//  Created by Adinay on 17/7/23.
//

import Foundation

class AuthViewModel {
    var phoneNumber = ""
    func authUser(phoneNumber: String, completion: @escaping ()->Void) {
        let string = phoneNumber
        let userData = ["phoneNumber": "\(phoneNumber)"].toData()

        NetworkManager().performVoid(urlRequest: ApiService.postAuthorizationUser(auth: userData).makeUrlRequest()) { [weak self] result in
            switch result {
            case .success:
                self?.phoneNumber = string
                completion() // Вызов обработчика завершения после успешной
            case .failure(let error):
                print(error)
            case .unauthorized(let string):
                print(string)
            case .forbidden(let string):
                print(string)
            case .notfound(let string):
                print(string)
            case .badrequest(let string):
                print(string)
            }
        }
    }
}
