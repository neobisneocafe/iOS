//
//  BonusesOrdersResponse.swift
//  NeoCafe
//
//  Created by Adinay on 16/8/23.
//

import Foundation

// MARK: - BonusesOrdersResponseElement

struct BonusesOrdersResponseElement: Codable, Equatable {
    var bonusPoints: Int?

    enum CodingKeys: String, CodingKey {
        case bonusPoints = "bonusPoints"
    }

    init(bonusPoints: Int?) {
        self.bonusPoints = bonusPoints
    }
}
