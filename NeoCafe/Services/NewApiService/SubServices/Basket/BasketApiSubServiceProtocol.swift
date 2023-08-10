//
//  BasketApiSubServiceProtocol.swift
//  NeoCafe
//
//  Created by Adinay on 8/8/23.
//

import Moya

// MARK: - Protocol

protocol BasketApiSubServiceProtocol {
    func fetchHistory() async throws -> BasketHistoryResponse
    func fetchOrders() async throws -> BasketOrdersResponse
}

// MARK: - Service

extension NewApiService: BasketApiSubServiceProtocol {
    func fetchHistory() async throws -> BasketHistoryResponse {
        try await requestDecodable(BasketTarget.fetchHistory)
    }
    
    func fetchOrders() async throws -> BasketOrdersResponse {
        return try await requestDecodable(BasketTarget.fetchOrders(1))
    }
    
//    func fetchOrders(id: Int) async throws -> BasketOrdersResponse {
//        let url = BasketTarget.fetchOrders(id)
//        return try await requestDecodable(url)
//    }
    
//    func fetchOrders() async throws -> BasketOrdersResponse {
//        return try await requestDecodable(BasketTarget.fetchOrders)
//    }
//    func fetchOrders() async throws -> BasketOrdersResponse {
//        try await requestDecodable(BasketTarget.fetchOrders)
//    }
}

// MARK: - Target

enum BasketTarget: CustomType {
    case fetchHistory
    case fetchOrders(_ id: Int)

    // MARK: - Props

    var path: String {
        switch self {
        case .fetchHistory:
            return "/basket"
        case .fetchOrders(let id):
            return "/basket/3\(id)"
        }
    }

    var method: Method {
        switch self {
        case .fetchHistory:
            return .get
        case .fetchOrders:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .fetchHistory:
            return .requestPlain
        case .fetchOrders:
            return .requestPlain
        }
    }

    var authorizationType: AuthorizationType? {
        switch self {
        case .fetchHistory:
            return .bearer
        default:
            return .none
        }
    }
}


//try await requestDecodable(DishesTarget.obtainList(request))
