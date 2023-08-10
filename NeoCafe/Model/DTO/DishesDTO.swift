//
//  DishesDTO.swift
//  NeoCafe
//
//  Created by Adinay on 28/7/23.
//

import Foundation

typealias DishesResponse = [DishesDTO]

// MARK: - DishesDTO
struct DishesDTO: Codable, Hashable {
    let data: [Datum]?
    let meta: Meta?
}


// MARK: - Datum
struct Datum: Codable, Hashable {
    let id: Int?
    let name: String?
    let price: String?
    let description: String?
    let isDeleted: Bool?
    let image: Image?
    let category: Category?
}


// MARK: - Category
struct Category: Codable, Hashable {
    let id: Int?
    let createdAt, updatedAt, name: String?
    let isDeleted: Bool?
}


// MARK: - Image
struct Image: Codable, Hashable {
    let id: Int?
    let createdAt, updatedAt: String?
    let url: String?
    let publicId: String?
}


// MARK: - Meta
struct Meta: Codable, Hashable {
    let page, itemsCount, limit, returned: Int?
    let offset, pagesCount: Int?
    let order, orderField: String?
}
