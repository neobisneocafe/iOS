//
//  QRCodesResponse.swift
//  NeoCafe
//
//  Created by Adinay on 2/8/23.
//

import Foundation

// MARK: - QRCodTableResponse

typealias QRCode = [QRCodTableResponse]

struct QRCodTableResponse: Codable, Equatable {
    let id: Int?
    let createdAt, updatedAt, name, uniqueCode: String?
    let qrcode: String?
    let isBooked: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
        case name = "name"
        case uniqueCode = "uniqueCode"
        case qrcode = "qrcode"
        case isBooked = "isBooked"
    }
}



