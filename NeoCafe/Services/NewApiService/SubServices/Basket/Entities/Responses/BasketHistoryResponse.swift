//
//  BasketHistoryResponse.swift
//  NeoCafe
//
//  Created by Adinay on 8/8/23.
//

import Foundation

public typealias BasketHistoryResponse = [BasketHistoryResponseElement]

public struct BasketHistoryResponseElement: Codable, Equatable {
    public let id: Int?
    public let createdAt: String?
    public let updatedAt: String?
    public let isApproved: Bool?
    public let isPaid: Bool?
    public let isCompleted: Bool?
    public let dishesPrice: Int?
    public let serviceCost: Int?
    public let overall: Int?
    public let dishes: [BasketHistoryDish]?
    public let branch: BasketHistoryBranch?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
        case isApproved = "isApproved"
        case isPaid = "isPaid"
        case isCompleted = "isCompleted"
        case dishesPrice = "dishesPrice"
        case serviceCost = "serviceCost"
        case overall = "overall"
        case dishes = "dishes"
        case branch = "branch"
    }

    public init(
        id: Int?,
        createdAt: String?,
        updatedAt: String?,
        isApproved: Bool?,
        isPaid: Bool?,
        isCompleted: Bool?,
        dishesPrice: Int?,
        serviceCost: Int?,
        overall: Int?,
        dishes: [BasketHistoryDish]?,
        branch: BasketHistoryBranch?
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.isApproved = isApproved
        self.isPaid = isPaid
        self.isCompleted = isCompleted
        self.dishesPrice = dishesPrice
        self.serviceCost = serviceCost
        self.overall = overall
        self.dishes = dishes
        self.branch = branch
    }
}

public struct BasketHistoryBranch: Codable, Equatable {
    public let id: Int?
    public let createdAt: String?
    public let updatedAt: String?
    public let name: String?
    public let managerName: String?
    public let adress: String?
    public let city: String?
    public let openingTime: String?
    public let closingTime: String?
    public let email: String?
    public let locationUrl: String?
    public let imageUrl: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
        case name = "name"
        case managerName = "managerName"
        case adress = "adress"
        case city = "city"
        case openingTime = "opening_time"
        case closingTime = "closing_time"
        case email = "email"
        case locationUrl = "locationUrl"
        case imageUrl = "imageUrl"
    }

    public init(
        id: Int?,
        createdAt: String?,
        updatedAt: String?,
        name: String?,
        managerName: String?,
        adress: String?,
        city: String?,
        openingTime: String?,
        closingTime: String?,
        email: String?,
        locationUrl: String?,
        imageUrl: String?
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.managerName = managerName
        self.adress = adress
        self.city = city
        self.openingTime = openingTime
        self.closingTime = closingTime
        self.email = email
        self.locationUrl = locationUrl
        self.imageUrl = imageUrl
    }
}

public struct BasketHistoryDish: Codable, Equatable {
    public let id: Int?
    public let createdAt: String?
    public let updatedAt: String?
    public let name: String?
    public let description: String?
    public let price: Int?
    public let isDeleted: Bool?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
        case name = "name"
        case description = "description"
        case price = "price"
        case isDeleted = "isDeleted"
    }

    public init(
        id: Int?,
        createdAt: String?,
        updatedAt: String?,
        name: String?,
        description: String?,
        price: Int?,
        isDeleted: Bool?
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.description = description
        self.price = price
        self.isDeleted = isDeleted
    }
}
