//
//  ProResult.swift
//  NeoCafe
//
//  Created by Adinay on 17/7/23.
//

import Foundation

enum ProResult <M>  {
    case success(M)
    case unauthorized(String)
    case forbidden(String)
    case notfound(String)
    case badrequest(String)
    case failure(String)
}
