//
//  CategoryApiSubService.swift
//  NeoCafe
//
//  Created by Adinay on 31/7/23.
//

import Moya

// MARK: - Protocol

protocol CategoryApiSubServiceProtocol {
    func obtainList(_ request: PaginationRequest) async throws -> CategoryListResponse
}

// MARK: - Service

extension NewApiService: CategoryApiSubServiceProtocol {
    func obtainList(_ request: PaginationRequest) async throws -> CategoryListResponse {
        try await requestDecodable(CategoryTarget.obtainList(request))
    }
}

// MARK: - Target

enum CategoryTarget: CustomType {
    case obtainList(_ request: PaginationRequest)

    // MARK: - Props

    var path: String {
        switch self {
        case .obtainList:
            return "/category/list"
        }
    }

    var method: Method {
        switch self {
        case .obtainList:
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
        }
    }

    var authorizationType: AuthorizationType? {
        switch self {
        default:
            return .none
        }
    }
}
