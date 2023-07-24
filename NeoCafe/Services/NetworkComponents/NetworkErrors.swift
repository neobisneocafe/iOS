//
//  NetworkErrors.swift
//  NeoCafe
//
//  Created by Adinay on 17/7/23.
//

import Foundation

enum NetworkErrors: Error {
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case internalServerError
}
