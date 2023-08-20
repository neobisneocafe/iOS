//
//  TableOrdersResponse.swift
//  NeoCafe
//
//  Created by Adinay on 18/8/23.
//


import Foundation

public struct TableOrdersResponse: Codable, Equatable {
    public let branch: TableOrdersBranch?
    public let dishesPrice: Int?
    public let bonusPoints: Int?
    public let overall: Int?
    public let dishes: [TableOrdersDish]?
    public let user: TableOrdersUser?
    public let id: Int?
    public let createdAt: String?
    public let updatedAt: String?
    public let isApproved: Bool?
    public let isPaid: Bool?
    public let isCompleted: Bool?

    enum CodingKeys: String, CodingKey {
        case branch = "branch"
        case dishesPrice = "dishesPrice"
        case bonusPoints = "bonusPoints"
        case overall = "overall"
        case dishes = "dishes"
        case user = "user"
        case id = "id"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
        case isApproved = "isApproved"
        case isPaid = "isPaid"
        case isCompleted = "isCompleted"
    }

    public init(branch: TableOrdersBranch?, dishesPrice: Int?, bonusPoints: Int?, overall: Int?, dishes: [TableOrdersDish]?, user: TableOrdersUser?, id: Int?, createdAt: String?, updatedAt: String?, isApproved: Bool?, isPaid: Bool?, isCompleted: Bool?) {
        self.branch = branch
        self.dishesPrice = dishesPrice
        self.bonusPoints = bonusPoints
        self.overall = overall
        self.dishes = dishes
        self.user = user
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.isApproved = isApproved
        self.isPaid = isPaid
        self.isCompleted = isCompleted
    }
}

public struct TableOrdersBranch: Codable, Equatable {
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

    public init(id: Int?, createdAt: String?, updatedAt: String?, name: String?, managerName: String?, adress: String?, city: String?, openingTime: String?, closingTime: String?, email: String?, locationUrl: String?, imageUrl: String?) {
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

public struct TableOrdersDish: Codable, Equatable {
    public let id: Int?
    public let createdAt: String?
    public let updatedAt: String?
    public let name: String?
    public let description: String?
    public let price: Int?
    public let isDeleted: Bool?
    public let isAddon: Bool?

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

    public init(id: Int?, createdAt: String?, updatedAt: String?, name: String?, description: String?, price: Int?, isDeleted: Bool?, isAddon: Bool?) {
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

public struct TableOrdersUser: Codable, Equatable {
    public let id: Int?
    public let createdAt: String?
    public let updatedAt: String?
    public let phoneNumber: String?
    public let firstName: String?
    public let dateOfBirth: String?
    public let role: String?
    public let confirmed: Bool?
    public let isDeleted: Bool?
    public let refreshToken: String?
    public let confirmCode: String?
    public let loginCode: String?
    public let bonusPoints: Int?
    public let table: [String]?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
        case phoneNumber = "phoneNumber"
        case firstName = "firstName"
        case dateOfBirth = "dateOfBirth"
        case role = "role"
        case confirmed = "confirmed"
        case isDeleted = "isDeleted"
        case refreshToken = "refresh_token"
        case confirmCode = "confirm_code"
        case loginCode = "login_code"
        case bonusPoints = "bonusPoints"
        case table = "table"
    }

    public init(id: Int?, createdAt: String?, updatedAt: String?, phoneNumber: String?, firstName: String?, dateOfBirth: String?, role: String?, confirmed: Bool?, isDeleted: Bool?, refreshToken: String?, confirmCode: String?, loginCode: String?, bonusPoints: Int?, table: [String]?) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.phoneNumber = phoneNumber
        self.firstName = firstName
        self.dateOfBirth = dateOfBirth
        self.role = role
        self.confirmed = confirmed
        self.isDeleted = isDeleted
        self.refreshToken = refreshToken
        self.confirmCode = confirmCode
        self.loginCode = loginCode
        self.bonusPoints = bonusPoints
        self.table = table
    }
}
