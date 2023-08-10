//
//  PaginationRequest.swift
//  NeoCafe
//
//  Created by Adinay on 31/7/23.
//

import Foundation

struct PaginationRequest: Codable {
    let page: Int
    let limit: Int
    let order: String
    let orderField: String

    init(
        page: Int,
        limit: Int,
        order: String = "ASC",
        orderField: String = "id"
    ) {
        self.page = page
        self.limit = limit
        self.order = order
        self.orderField = orderField
    }
}
