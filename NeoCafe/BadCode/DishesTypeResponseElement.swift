//
//  DishesTypeResponse.swift
//  NeoCafe
//
//  Created by Adinay on 16/8/23.
//

import Foundation

struct DishesTypeResponseElement: Codable, Equatable {
    var id: Int?
    var createdAt: String?
    var updatedAt: String?
    var name: String?
    var description: String?
    var price: Int?
    var isDeleted: Bool?
    var isAddon: Bool?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
        case name = "name"
        case description = "description"
        case price = "price"
        case isDeleted = "isDeleted"
        case isAddon = "isAddon"
    }

    init(id: Int?,
         createdAt: String?,
         updatedAt: String?,
         name: String?,
         description: String?,
         price: Int?,
         isDeleted: Bool?,
         isAddon: Bool?)
    {
        
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.description = description
        self.price = price
        self.isDeleted = isDeleted
        self.isAddon = isAddon
    }
}
