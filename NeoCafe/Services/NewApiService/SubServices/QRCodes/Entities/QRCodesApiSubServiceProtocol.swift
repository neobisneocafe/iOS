//
//  QRCodesApiSubServiceProtocol.swift
//  NeoCafe
//
//  Created by Adinay on 2/8/23.
//


import Moya

// MARK: - Protocol

protocol QRCodesApiSubServiceProtocol {
    func tableId(_ request: QRCodTableResponse) async throws -> QRCodTableResponse
}

// MARK: - Service

//
//extension NewApiService: QRCodesApiSubServiceProtocol {
//    func tableId(_ request: QRCodTableResponse) async throws -> QRCodTableResponse {
//        try await requestDecodable(QRCodTableResponse.tableId(request))
//    }
//}

// MARK: - Target

enum QRCodesyTarget: CustomType {
    case tableId(_ request: QRCodTableResponse)

    // MARK: - Props
   
    var path: String {
        switch self {
        case .tableId:
            return "/api/table/2"
        }
    }

    var method: Method {
        switch self {
        case .tableId:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .tableId(let request):
            return .requestParameters(
                parameters: [
                    "id": request.id ?? "",
                    "name": request.name ?? "",
                    "uniqueCode":request.uniqueCode ?? "",
                    "qrcode": request.qrcode ?? ""
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
