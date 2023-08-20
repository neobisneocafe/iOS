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
    func fetchTableOrders(_ request: TableOrdersRequest, branchId: Int ) async throws -> TableOrdersResponse
}

// MARK: - Service

extension NewApiService: BasketApiSubServiceProtocol {
    func fetchHistory() async throws -> BasketHistoryResponse {
        try await requestDecodable(BasketTarget.fetchHistory)
    }
    
    func fetchOrders(_ id: Int) async throws -> BasketOrdersResponseElement {
        return try await requestDecodable(BasketTarget.fetchOrders(id))
    }
    
    func fetchTableOrders(_ request: TableOrdersRequest, branchId: Int)  async throws -> TableOrdersResponse {
        return try await requestDecodable(BasketTarget.fetchTableOrders(request, branchId: branchId))
    }
}

// MARK: - Target

enum BasketTarget: CustomType {
    case fetchHistory
    case fetchOrders(_ id: Int)
    case fetchTableOrders(_ request: TableOrdersRequest, branchId: Int)
    // MARK: - Props

    var path: String {
        switch self {
        case .fetchHistory:
            return "/basket"
        case .fetchOrders(let id):
            return "/basket/\(id)"
        case .fetchTableOrders(_, let branchId):
            return "/api/basket/\(branchId)/order"
        }
    }

    var method: Method {
        switch self {
        case .fetchHistory:
            return .get
        case .fetchOrders:
            return .get
        case .fetchTableOrders:
            return .post
        }
    }

    var task: Task {
        switch self {
        case .fetchHistory:
            return .requestPlain
        case .fetchOrders:
            return .requestPlain
        case .fetchTableOrders(let request, branchId: _ ):
            return .requestJSONEncodable(request)
        }
    }

    var authorizationType: AuthorizationType? {
        .bearer
    }
}
