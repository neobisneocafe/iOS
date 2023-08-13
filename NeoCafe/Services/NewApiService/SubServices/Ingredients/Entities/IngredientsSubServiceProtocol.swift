//
//  IngredientsSubServiceProtocol.swift
//  NeoCafe
//
//  Created by Adinay on 12/8/23.
//

import Moya

// MARK: - Protocol

protocol IngredientsSubServiceProtocol {
    func fetchIngredient() async throws -> IngredientResponseElement
}

// MARK: - Service

extension NewApiService: IngredientsSubServiceProtocol {
    func fetchIngredient() async throws -> IngredientResponseElement {
        try await requestDecodable(IngredientsTarget.fetchIngredient)
    }
}

// MARK: - Target

enum IngredientsTarget: CustomType {
    case fetchIngredient
    
    // MARK: - Props
    
    var path: String {
        switch self {
        case .fetchIngredient:
            return "/menu-items"
        }
        
    }
    var method: Method {
        switch self {
        case .fetchIngredient:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .fetchIngredient:
            return .requestPlain
        }
    }
    
    var authorizationType: AuthorizationType? {
        .bearer
    }
}
