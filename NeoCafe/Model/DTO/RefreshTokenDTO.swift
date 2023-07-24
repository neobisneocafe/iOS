//
//  RefreshTokenDTO.swift
//  NeoCafe
//
//  Created by Adinay on 18/7/23.
//

import Foundation

struct RefreshToken: Codable {
    let accessToken: String?
    let refreshToken: String?
}
