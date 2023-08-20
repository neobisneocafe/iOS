//
//  BookQrRequest.swift
//  NeoCafe
//
//  Created by Adinay on 20/8/23.
//

import Foundation

struct BookQrRequest: Codable, Equatable {
    let branchId: Int
    let uniqueCode: String
}
