//
//  RegisterVerificationViewModel.swift
//  NeoCafe
//
//  Created by Adinay on 17/7/23.
//

import Foundation

class RegisterVerificationViewModel {
    
    var code = ""
    func registerVerification(phoneNumber: String, code: String, completion: @escaping (String) -> Void) {
        NetworkManager().sendRequest(urlRequest: ApiService.postActiveToken(token: code).makeUrlRequest()) { response
            in
            switch response {
            case .success(let string):
                print(string)
                self.code = string as! String
                completion(string as! String)
            case .unauthorized(let string):
                print(string)
            case .forebidden(let string):
                print(string)
            case .notfound(let string):
                print(string)
            case .badrequest(let string):
                print(string)
            case .failerror(let string):
                print(string)
            }
        }
    }
}
