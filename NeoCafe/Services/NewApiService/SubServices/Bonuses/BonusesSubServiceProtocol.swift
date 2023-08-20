//
//  BonusesSubServiceProtocol.swift
//  NeoCafe
//
//  Created by Adinay on 16/8/23.
//

import Moya

// MARK: - Protocol

protocol BonusesSubServiceProtocol {
    func fetchBonuses() async throws -> BonusesOrdersResponseElement
}

// MARK: - Service

extension NewApiService: BonusesSubServiceProtocol {
    func fetchBonuses() async throws -> BonusesOrdersResponseElement {
        try await requestDecodable(BonusesTarget.fetchBonuses)
    }
}

// MARK: - Target

enum BonusesTarget: CustomType {
    case fetchBonuses
    
    // MARK: - Props
    
    var path: String {
        switch self {
        case .fetchBonuses:
            return "/user/bonus"
        }
    }
    
    var method: Method {
        switch self {
        case .fetchBonuses:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .fetchBonuses:
            return .requestPlain
        }
        
    }
    
    var authorizationType: AuthorizationType? {
        .bearer
    }
}

