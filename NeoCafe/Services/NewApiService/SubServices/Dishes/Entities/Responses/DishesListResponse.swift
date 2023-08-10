//
//  DishesListResponse.swift
//  NeoCafe
//
//  Created by Adinay on 31/7/23.
//

import Foundation

public struct DishesListResponse: Codable, Equatable {
    public let data: [DishesListItem]?
    public let meta: DishesListMeta?

    enum CodingKeys: String, CodingKey {
        case data = "data"
        case meta = "meta"
    }

    public init(data: [DishesListItem]?, meta: DishesListMeta?) {
        self.data = data
        self.meta = meta
    }
}

public struct DishesListItem: Codable, Equatable {
    public let id: Int?
    public let createdAt: String?
    public let updatedAt: String?
    public let name: String?
    public let description: String?
    public let price: String?
    public let isDeleted: Bool?
    public let image: DishesListImage?
    public let category: DishesListCategory?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
        case name = "name"
        case description = "description"
        case price = "price"
        case isDeleted = "isDeleted"
        case image = "image"
        case category = "category"
    }

    public init(
        id: Int?,
        createdAt: String?,
        updatedAt: String?,
        name: String?,
        description: String?,
        price: String?,
        isDeleted: Bool?,
        image: DishesListImage?,
        category: DishesListCategory?
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.description = description
        self.price = price
        self.isDeleted = isDeleted
        self.image = image
        self.category = category
    }
}

public struct DishesListCategory: Codable, Equatable {
    public let id: Int?
    public let createdAt: String?
    public let updatedAt: String?
    public let name: String?
    public let isDeleted: Bool?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
        case name = "name"
        case isDeleted = "isDeleted"
    }

    public init(
        id: Int?,
        createdAt: String?,
        updatedAt: String?,
        name: String?,
        isDeleted: Bool?
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.isDeleted = isDeleted
    }
}

public struct DishesListImage: Codable, Equatable {
    public let id: Int?
    public let createdAt: String?
    public let updatedAt: String?
    public let url: String?
    public let publicId: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
        case url = "url"
        case publicId = "publicId"
    }

    public init(
        id: Int?,
        createdAt: String?,
        updatedAt: String?,
        url: String?,
        publicId: String?
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.url = url
        self.publicId = publicId
    }
}

public struct DishesListMeta: Codable, Equatable {
    public let page: Int?
    public let itemsCount: Int?
    public let limit: Int?
    public let returned: Int?
    public let offset: Int?
    public let pagesCount: Int?
    public let order: String?
    public let orderField: String?

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

    public init(
        page: Int?,
        itemsCount: Int?,
        limit: Int?,
        returned: Int?,
        offset: Int?,
        pagesCount: Int?,
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
