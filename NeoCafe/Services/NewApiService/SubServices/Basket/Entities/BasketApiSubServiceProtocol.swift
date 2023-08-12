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
    func fetchOrders(_ id: Int) async throws -> BasketOrdersResponseElement
//    func fetchWriteOffOf(_ id: Int, _ id: Int ) ->
}

// MARK: - Service

extension NewApiService: BasketApiSubServiceProtocol {
    func fetchHistory() async throws -> BasketHistoryResponse {
        try await requestDecodable(BasketTarget.fetchHistory)
    }
    
    func fetchOrders(_ id: Int) async throws -> BasketOrdersResponseElement {
        return try await requestDecodable(BasketTarget.fetchOrders(id))
    }
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
            return "/basket/\(id)"
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
        .bearer
    }
}
