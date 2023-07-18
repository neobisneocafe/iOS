//
//  StatusCode.swift
//  NeoCafe
//
//  Created by Adinay on 17/7/23.
//

import Foundation

enum StatusCode: Int {
    case success = 200
    case noContent = 204
    case badRequest = 400
    case unauthorized = 401
    case forbidden = 403
    case notFound = 404
    case internalServerError = 500
}

func handleResponse(responseCode: Int) {
    switch StatusCode(rawValue: responseCode) {
    case .success:
        print("Success")
    case.noContent:
        print("No Content")
    case .badRequest:
        print("Bad Request")
    case .unauthorized:
        print("Unauthorized")
    case .forbidden:
        print("Forbidden")
    case .notFound:
        print("Not Found")
    case .internalServerError:
        print("Internal Server Error")
    default:
        print("Unknown Status Code")
    }
}

//enum NetworkError: Error {
//    case unauthorized
//    case badRequest
//    case forbidden
//    case notFound
//    case serverError(String)
//}



//enum StatusCode {
//    case success(description: String)
//    case badRequest (description: String)
//    case forbidden (description: String)
//    case notFound (description: String)
//    case unAuthorized (description: String)
//
//    var code: Int {
//        switch self {
//        case .success:
//            return 200
//        case .badRequest:
//            return 400
//        case .forbidden:
//            return 403
//        case .notFound:
//            return 404
//        case .unAuthorized:
//            return 401
//        }
//    }
//}
