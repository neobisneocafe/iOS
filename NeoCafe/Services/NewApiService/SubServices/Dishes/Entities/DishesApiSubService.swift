//
//  DishesApiSubService.swift
//  NeoCafe
//
//  Created by Adinay on 31/7/23.
//

import Moya

// MARK: - Protocol

protocol DishesApiSubServiceProtocol {
    func obtainList(_ request: PaginationRequest) async throws -> DishesListResponse
    func obtainDishesById(_ id: Int) async throws  -> DishesListItem
    func obtainAddonDishes() async throws -> AddonDishesResponse
}

// MARK: - Service

extension NewApiService: DishesApiSubServiceProtocol {
    func obtainList(_ request: PaginationRequest) async throws -> DishesListResponse {
        try await requestDecodable(DishesTarget.obtainList(request))
    }
    
    func obtainDishesById(_ id: Int) async throws -> DishesListItem {
        try await requestDecodable(DishesTarget.obtainDishesById(id))
    }

    func obtainAddonDishes() async throws -> AddonDishesResponse {
        try await requestDecodable(DishesTarget.obtainAddon)
    }
}

// MARK: - Target

enum DishesTarget: CustomType {
    case obtainList(_ request: PaginationRequest)
    case obtainDishesById(_ id: Int)
    case obtainAddon
    
    // MARK: - Props
    
    var path: String {
        switch self {
        case .obtainList:
            return "/dishes/list"
            
        case .obtainDishesById(let id):
            return "/dishes/\(id)"
            
        case .obtainAddon:
            return "/dishes/sorted/by/type"
        }
        
    }
    
    var method: Method {
        switch self {
        case .obtainList:
            return .get
            
        case .obtainDishesById:
            return .get
            
        case .obtainAddon:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .obtainList(let request):
            return .requestParameters(
                parameters: [
                    "page": request.page,
                    "limit": request.limit,
                    "order": request.order,
                    "orderField": request.orderField
                ],
                encoding: URLEncoding.default
            )
            
        case .obtainDishesById:
            return .requestPlain
            
        case .obtainAddon:
            return .requestParameters(
                parameters: [
                    "isAddon": true
                ],
                encoding: URLEncoding(boolEncoding: .literal)
            )
        }
    }
    
    var authorizationType: AuthorizationType? {
        switch self {
        default:
            return .none
        }
    }
}









//    func obtainType() async throws -> DishesTypeResponseElement {
//        try await requestDecodable(DishesTarget.obtainType)
//    }
//case obtainType
//    func obtainType()  async throws -> DishesTypeResponseElement
