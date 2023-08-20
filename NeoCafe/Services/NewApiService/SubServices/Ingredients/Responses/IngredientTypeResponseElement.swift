//
//  IngredientTypeResponseElement.swift
//  NeoCafe
//
//  Created by Adinay on 16/8/23.
//

import Foundation

struct IngredientTypeResponseElement: Codable, Equatable {
    var data: [IngredientTypeOrdersResponseDatum]?
    var meta: IngridientOrdersResponseMeta?

    enum CodingKeys: String, CodingKey {
        case data = "data"
        case meta = "meta"
    }

    init(data: [IngredientTypeOrdersResponseDatum]?, meta: IngridientOrdersResponseMeta?) {
        self.data = data
        self.meta = meta
    }
}


// MARK: - BasketOrdersResponseDatum

struct IngredientTypeOrdersResponseDatum: Codable, Equatable {
    var id: Int?
    var createdAt: String?
    var updatedAt: String?
    var name: String?
    var imageUrl: String?
    var price: String?
    var quantity: String?
    var minLimit: String?
    var arrivalDate: String?
    var type: String?

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
        case type = "type"
    }

    init(id: Int?,
         createdAt: String?,
         updatedAt: String?,
         name:String?,
         imageUrl: String?,
         price: String?,
         quantity: String?,
         minLimit: String?,
         arrivalDate: String?,
         type: String?
    ) {
        
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.imageUrl = imageUrl
        self.price = price
        self.quantity = quantity
        self.minLimit = minLimit
        self.arrivalDate = arrivalDate
        self.type = type
    }
}


// MARK: - BasketOrdersResponseMeta

struct IngridientOrdersResponseMeta: Codable, Equatable {
    var page: Int?
    var itemsCount: Int?
    var limit: Int?
    var returned: Int?
    var offset: Int?
    var pagesCount: Int?
    var order: String?
    var orderField: String?

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

    init(page: Int?,
         itemsCount: Int?,
         limit: Int?, returned: Int?,
         offset: Int?, pagesCount: Int?,
         order: String?,
         orderField: String?
    ) {
        
        self.page = page
        self.itemsCount = itemsCount
        self.limit = limit
        self.returned = returned
        self.offset = offset
        self.pagesCount = pagesCount
        self.order = order
        self.orderField = orderField
    }
}
