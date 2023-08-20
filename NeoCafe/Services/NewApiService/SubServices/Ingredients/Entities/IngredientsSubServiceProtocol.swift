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
    func fetchTypeIngredient()  async throws -> IngredientTypeResponseElement
}

// MARK: - Service

extension NewApiService: IngredientsSubServiceProtocol {
    func fetchIngredient() async throws -> IngredientResponseElement {
        try await requestDecodable(IngredientsTarget.fetchIngredient)
    }
    
    func fetchTypeIngredient() async throws -> IngredientTypeResponseElement {
        try await requestDecodable(IngredientsTarget.fetchIngredientType)
    }
}

// MARK: - Target

enum IngredientsTarget: CustomType {
    case fetchIngredient
    case fetchIngredientType
    
    // MARK: - Props
    
    var path: String {
        switch self {
        case .fetchIngredient:
            return "/menu-items/list"
            
        case .fetchIngredientType:
            return "menu-items/sorted/by/type?type=MILK"
        }
        
    }
    var method: Method {
        switch self {
        case .fetchIngredient:
            return .get
            
        case .fetchIngredientType:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .fetchIngredient:
            return .requestPlain
            
        case .fetchIngredientType:
            return .requestPlain
        }
    }
    
    var authorizationType: AuthorizationType? {
        .bearer
    }
}
