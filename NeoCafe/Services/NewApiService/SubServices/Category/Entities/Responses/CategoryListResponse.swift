//
//  CategoryListResponse.swift
//  NeoCafe
//
//  Created by Adinay on 31/7/23.
//

import Foundation

public struct CategoryListResponse: Codable, Equatable {
    public let data: [CategoryListItem]?
    public let meta: CategoryListMeta?

    enum CodingKeys: String, CodingKey {
        case data = "data"
        case meta = "meta"
    }

    public init(
        data: [CategoryListItem]?,
        meta: CategoryListMeta?
    ) {
        self.data = data
        self.meta = meta
    }
}

public struct CategoryListItem: Codable, Equatable {
    public let id: Int?
    public let createdAt: String?
    public let updatedAt: String?
    public let name: String?
    public let isDeleted: Bool?
    public let imageUrl: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
        case name = "name"
        case isDeleted = "isDeleted"
        case imageUrl = "image_url"
    }

    public init(
        id: Int?,
        createdAt: String?,
        updatedAt: String?,
        name: String?,
        isDeleted: Bool?,
        imageUrl: String?
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.isDeleted = isDeleted
        self.imageUrl = imageUrl
   
    }
}

public struct CategoryListMeta: Codable, Equatable {
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
