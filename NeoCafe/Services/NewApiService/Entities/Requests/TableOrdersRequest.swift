//
//  TableOrdersRequest.swift
//  NeoCafe
//
//  Created by Adinay on 18/8/23.
//

import Foundation

// MARK: - TableOrdersRequest

struct TableOrdersRequest: Codable, Equatable {
     init(uniqueCode: String, dishId: [Int], bonusPoints: Int) {
        self.uniqueCode = uniqueCode
        self.dishId = dishId
        self.bonusPoints = bonusPoints
    }
    
    var uniqueCode: String
    var dishId: [Int]
    var bonusPoints: Int

    enum CodingKeys: String, CodingKey {
        case uniqueCode = "uniqueCode"
        case dishId = "dishId"
        case bonusPoints = "bonusPoints"
    }
}
