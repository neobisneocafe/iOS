//
//  BranchDTO.swift
//  NeoCafe
//
//  Created by Adinay on 20/7/23.
//

import Foundation

typealias BranchResponse = [BranchDTO]

struct BranchDTO: Codable {
    let id: Int?
    let createdAt, updatedAt, name, managerName: String?
    let adress, city, openingTime, closingTime: String?
    let email: String?
    let locationURL: String?
    let imageURL: String?
    let idDeleted: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id, createdAt, updatedAt, name, managerName, adress, city
        case openingTime = "opening_time"
        case closingTime = "closing_time"
        case email
        case locationURL = "locationUrl"
        case imageURL = "imageUrl"
        case idDeleted
    }
}


