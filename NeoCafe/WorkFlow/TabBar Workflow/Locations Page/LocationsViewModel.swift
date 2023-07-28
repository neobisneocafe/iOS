//
//  LocationsViewModel.swift
//  NeoCafe
//
//  Created by Adinay on 20/7/23.
//

import Foundation

class LocationsViewModel {
    var branches = BranchResponse()

       func fetchBranches(completion: @escaping (BranchResponse) -> Void) {
           NetworkManager().performRequest(urlRequest: ApiService.getBranches.makeUrlRequest(), successModel: BranchResponse.self) { [weak self] result in
               switch result {
               case .success(let models):
                   self?.branches = models
                   completion(models)
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
