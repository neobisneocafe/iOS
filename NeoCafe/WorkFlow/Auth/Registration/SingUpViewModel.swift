//
//  SingUpViewModel.swift
//  NeoCafe
//
//  Created by Adinay on 17/7/23.
//

import Foundation

//protocol SingUpViewModelProtocol {
//    func singUpUser(firstName: String , phoneNumber: String)
//}

class SignUpViewModel {
    func signUpUser(firstName: String, phoneNumber: String, completion: @escaping ()->Void) {
        let data = ["firstName": "\(firstName)",
                    "phoneNumber": "\(phoneNumber)"].toData()
        NetworkManager().performRequest(urlRequest: ApiService.postRegisterUser(user: data).makeUrlRequest(), successModel: RegistrationDTO.self) { result in
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

