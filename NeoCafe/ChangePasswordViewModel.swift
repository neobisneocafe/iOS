//
//  ChangePasswordViewModel.swift
//  NeoCafe
//
//  Created by Adinay on 6/8/23.
//

import Foundation

class ChangePasswordViewModel {
    
    // MARK: - Запрос на изменение пароля
    
    func userPasswordChange(firstName: String, phoneNumber: String, completion: @escaping ()->Void ) {
        let passwords = ["firstName":"\(firstName)",
                         "phoneNumber":"\(phoneNumber)"]
        NetworkManager().sendRequest(urlRequest: ApiService.сhangePassword(firstName: firstName, phoneNumber: phoneNumber).makeUrlRequest()) { result in
            switch result {
            case .success(let string):
                print(string)
                completion()
            case .unauthorized(let string):
                print(string)
            case .forbidden(let string):
                print(string)
            case .notfound(let string):
                print(string)
            case .badrequest(let string):
                print(string)
            case .failure(let string):
                print(string)
            }
        }
    }
}
