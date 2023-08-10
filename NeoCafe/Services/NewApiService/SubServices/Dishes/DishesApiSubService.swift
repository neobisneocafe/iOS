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
}

// MARK: - Service

extension NewApiService: DishesApiSubServiceProtocol {
    func obtainList(_ request: PaginationRequest) async throws -> DishesListResponse {
        try await requestDecodable(DishesTarget.obtainList(request))
    }
}

// MARK: - Target

enum DishesTarget: CustomType {
    case obtainList(_ request: PaginationRequest)
    case obtainDishesById(_ id: Int)

    // MARK: - Props

    var path: String {
        switch self {
        case .obtainList:
            return "/dishes/list"

        case .obtainDishesById(let id):
            return "/dishes/\(id)"
        }
    }

    var method: Method {
        switch self {
        case .obtainList:
            return .get

        case .obtainDishesById:
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
        }
    }

    var authorizationType: AuthorizationType? {
        switch self {
        default:
            return .none
        }
    }
}
