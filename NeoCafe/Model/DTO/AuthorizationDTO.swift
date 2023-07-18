//
//  AuthorizationDTO.swift
//  NeoCafe
//
//  Created by Adinay on 17/7/23.
//

import Foundation

struct AuthorizationDTO: Codable {
    let phoneNumber: String?
    
    enum CodingKeys: String, CodingKey {
        case phoneNumber
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        phoneNumber = try container.decodeIfPresent(String.self, forKey: .phoneNumber)
    }
}
