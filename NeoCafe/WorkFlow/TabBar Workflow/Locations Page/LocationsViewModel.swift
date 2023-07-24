//
//  LocationsViewModel.swift
//  NeoCafe
//
//  Created by Adinay on 20/7/23.
//

import Foundation

//class LocationsViewModel {
//    var branches = [BranchDTO]()
//
//       func fetchBranches(completion: @escaping ()->()) {
//           guard let url = URL(string: "https://neo-cafe-neobis-d301ec8e3f9a.herokuapp.com/api/branch") else { return }
//           NetworkManager().performRequest(urlRequest: ApiService.postBranches.makeUrlRequest(), successModel: [BranchDTO].self) { [weak self] result in
//               switch result {
//               case .success(let models):
//                   self?.branches = models
//                   completion()
//               case .failure(let error):
//                   print(error)
//               case .unauthorized(let string):
//                   print(string)
//               case .forbidden(let string):
//                   print(string)
//               case .notfound(let string):
//                   print(string)
//               case .badrequest(let string):
//                   print(string)
//               }
//           }
//       }
//}
