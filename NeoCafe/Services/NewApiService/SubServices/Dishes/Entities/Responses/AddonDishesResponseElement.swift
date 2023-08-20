//
//  AddonDishesResponseElement.swift
//  NeoCafe
//
//  Created by Adinay on 17/8/23.
//

import Foundation

public typealias AddonDishesResponse = [AddonDishesResponseElement]

public struct AddonDishesResponseElement: Codable, Equatable {
    public let id: Int?
    public let createdAt: String?
    public let updatedAt: String?
    public let name: String?
    public let description: String?
    public let price: Int?
    public let isDeleted: Bool?
    public let isAddon: Bool?
    public let url: String?
    

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
        case name = "name"
        case description = "description"
        case price = "price"
        case isDeleted = "isDeleted"
        case isAddon = "isAddon"
        case url = "url"
    }

    public init(
        id: Int?,
        createdAt: String?,
        updatedAt: String?,
        name: String?,
        description: String?,
        price: Int?,
        isDeleted: Bool?,
        isAddon: Bool?,
        url: String
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.description = description
        self.price = price
        self.isDeleted = isDeleted
        self.isAddon = isAddon
        self.url = url
    }
}
