//
//  IngredientResponse.swift
//  NeoCafe
//
//  Created by Adinay on 12/8/23.
//

import Foundation

// MARK: - BasketOrdersResponseElement

struct IngredientResponseElement: Codable, Equatable {
    let data: [IngredientResponseDatum]?
    let meta: IngredientResponseMeta?

    enum CodingKeys: String, CodingKey {
        case data = "data"
        case meta = "meta"
    }
}


// MARK: - BasketOrdersResponseDatum

struct IngredientResponseDatum: Codable, Equatable {
    let id: Int?
    let createdAt: String?
    let updatedAt: String?
    let name: String?
    let imageUrl: String?
    let price: String?
    let quantity: String?
    let minLimit: String?
    let arrivalDate: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
        case name = "name"
        case imageUrl = "image_url"
        case price = "price"
        case quantity = "quantity"
        case minLimit = "min_limit"
        case arrivalDate = "arrivalDate"
    }
}


// MARK: - BasketOrdersResponseMeta

struct IngredientResponseMeta: Codable, Equatable {
    let page: Int?
    let itemsCount: Int?
    let limit: Int?
    let returned: Int?
    let offset: Int?
    let pagesCount: Int?
    let order: String?
    let orderField: String?

    enum CodingKeys: String, CodingKey {
        case page = "page"
        case itemsCount = "itemsCount"
        case limit = "limit"
        case returned = "returned"
        case offset = "offset"
        case pagesCount = "pagesCount"
        case order = "order"
        case orderField = "orderField"
    }
}
