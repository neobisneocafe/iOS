//
//  AccessTokenResponse.swift
//  NeoCafe
//
//  Created by Adinay on 21/7/23.
//

import Foundation

struct AccessTokenResponse: Codable, Equatable {
    public let accessToken: String?

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
    }

    public init(accessToken: String?) {
        self.accessToken = accessToken
    }
}
