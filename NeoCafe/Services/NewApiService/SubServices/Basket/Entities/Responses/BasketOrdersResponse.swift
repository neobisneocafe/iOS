//
//  BasketOrdersResponse.swift
//  NeoCafe
//
//  Created by Adinay on 8/8/23.
//

import Foundation

// MARK: - BasketOrdersResponseElement

typealias BasketOrdersResponse = [BasketOrdersResponseElement]

struct BasketOrdersResponseElement: Codable, Equatable {
    let id: Int?
    let createdAt: String?
    let updatedAt: String?
    let isApproved: Bool?
    let isPaid: Bool?
    let isCompleted: Bool?
    let dishesPrice: Int?
    let serviceCost: Int?
    let overall: Int?
    let dishes: [BasketOrdersResponseDish]?
    let branch: BasketOrdersResponseBranch?
    
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

    init(id: Int?,
         createdAt: String?,
         updatedAt: String?,
         isApproved: Bool?,
         isPaid: Bool?,
         isCompleted: Bool?,
         dishesPrice: Int?,
         serviceCost: Int?,
         overall: Int?,
         dishes: [BasketOrdersResponseDish]?,
         branch: BasketOrdersResponseBranch?
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


// MARK: - BasketOrdersResponseBranch

struct BasketOrdersResponseBranch: Codable, Equatable {
    let id: Int?
    let createdAt: String?
    let updatedAt: String?
    let name: String?
    let managerName: String?
    let adress: String?
    let city: String?
    let openingTime: String?
    let closingTime: String?
    let email: String?
    let locationUrl: String?
    let imageUrl: String?
    
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

    init(id: Int?,
         createdAt: String?,
         updatedAt: String?,
         name: String?, managerName:
         String?,
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



// MARK: - BasketOrdersResponseDish

struct BasketOrdersResponseDish: Codable, Equatable {
    let id: Int?
    let createdAt: String?
    let updatedAt: String?
    let name: String?
    let description: String?
    let price: Int?
    let isDeleted: Bool?
    let image: BasketOrdersResponseImage?
    let category: BasketOrdersResponseCategory?
    
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

    init(id: Int?,
         createdAt:
         String?, updatedAt:
         String?, name: String?,
         description: String?,
         price: Int?,
         isDeleted: Bool?,
         image: BasketOrdersResponseImage?,
         category: BasketOrdersResponseCategory?
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



// MARK: - BasketOrdersResponseCategory

struct BasketOrdersResponseCategory: Codable, Equatable {
    let id: Int?
    let createdAt: String?
    let updatedAt: String?
    let name: String?
    let isDeleted: Bool?
    let imageUrl: String?
    
    enum CodingKeys: String, CodingKey {
            case id = "id"
            case createdAt = "createdAt"
            case updatedAt = "updatedAt"
            case name = "name"
            case isDeleted = "isDeleted"
            case imageUrl = "image_url"
        }

    init(id: Int?,
         createdAt: String?,
         updatedAt: String?,
         name: String?,
         isDeleted: Bool?,
         imageUrl: String?) {
        
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.isDeleted = isDeleted
        self.imageUrl = imageUrl
    }
}


// MARK: - BasketOrdersResponseImage

struct BasketOrdersResponseImage: Codable, Equatable {
    let id: Int?
    let createdAt: String?
    let updatedAt: String?
    let url: String?
    let publicId: String?
    
    enum CodingKeys: String, CodingKey {
            case id = "id"
            case createdAt = "createdAt"
            case updatedAt = "updatedAt"
            case url = "url"
            case publicId = "publicId"
        }

    init(id: Int?,
         createdAt: String?,
         updatedAt: String?,
         url: String?,
         publicId: String?) {
        
        
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.url = url
        self.publicId = publicId
    }
}








// MARK: - BasketOrdersResponseElement
//
//typealias BasketOrdersResponse = [BasketOrdersResponseElement]
//
//struct BasketOrdersResponseElement: Codable {
//
//    let id: Int?
//    let createdAt: String?
//    let updatedAt: String?
//    let isApproved: Bool?
//    let isPaid: Bool?
//    let isCompleted: Bool?
//    let dishesPrice: Int?
//    let serviceCost: Int?
//    let overall: Int?
//    let dishes: [BasketOrdersResponseDish]?
//    let branch: String?
//
//    enum CodingKeys: String, CodingKey {
//        case id = "id"
//        case createdAt = "createdAt"
//        case updatedAt = "updatedAt"
//        case isApproved = "isApproved"
//        case isPaid = "isPaid"
//        case isCompleted = "isCompleted"
//        case dishesPrice = "dishesPrice"
//        case serviceCost = "serviceCost"
//        case overall = "overall"
//        case dishes = "dishes"
//        case branch = "branch"
//    }
//
//    init(id: Int?,
//         createdAt: String?,
//         updatedAt: String?,
//         isApproved: Bool?,
//         isPaid: Bool?,
//         isCompleted: Bool?,
//         dishesPrice: Int?,
//         serviceCost: Int?,
//         overall: Int?,
//         dishes: [BasketOrdersResponseDish]?,
//         branch: String?
//    ) {
//
//        self.id = id
//        self.createdAt = createdAt
//        self.updatedAt = updatedAt
//        self.isApproved = isApproved
//        self.isPaid = isPaid
//        self.isCompleted = isCompleted
//        self.dishesPrice = dishesPrice
//        self.serviceCost = serviceCost
//        self.overall = overall
//        self.dishes = dishes
//        self.branch = branch
//    }
//}
//
//
//
//// MARK: - BasketOrdersResponseDish
//
//struct BasketOrdersResponseDish: Codable {
//
//    let id: Int?
//    let createdAt: String?
//    let updatedAt: String?
//    let name: String?
//    let description: String?
//    let price: String?
//    let isDeleted: Bool?
//    let image: BasketOrdersResponseImage?
//
//    enum CodingKeys: String, CodingKey {
//        case id = "id"
//        case createdAt = "createdAt"
//        case updatedAt = "updatedAt"
//        case name = "name"
//        case description = "description"
//        case price = "price"
//        case isDeleted = "isDeleted"
//        case image = "image"
//    }
//
//    init(id: Int?,
//         createdAt: String?,
//         updatedAt: String?,
//         name: String?,
//         description: String?,
//         price: String?,
//         isDeleted: Bool?,
//         image: BasketOrdersResponseImage?
//    ) {
//        self.id = id
//        self.createdAt = createdAt
//        self.updatedAt = updatedAt
//        self.name = name
//        self.description = description
//        self.price = price
//        self.isDeleted = isDeleted
//        self.image = image
//    }
//}
//
//
//// MARK: - BasketOrdersResponseImage
//
//struct BasketOrdersResponseImage: Codable {
//
//    let id: Int?
//    let createdAt: String?
//    let updatedAt: String?
//    let url: String?
//    let publicId: String?
//
//    enum CodingKeys: String, CodingKey {
//        case id = "id"
//        case createdAt = "createdAt"
//        case updatedAt = "updatedAt"
//        case url = "url"
//        case publicId = "publicId"
//    }
//
//    init(id: Int?,
//         createdAt: String?,
//         updatedAt: String?,
//         url: String?,
//         publicId: String?
//    ) {
//        self.id = id
//        self.createdAt = createdAt
//        self.updatedAt = updatedAt
//        self.url = url
//        self.publicId = publicId
//    }
//}


