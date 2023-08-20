//
//  QRCodesApiSubServiceProtocol.swift
//  NeoCafe
//
//  Created by Adinay on 2/8/23.
//


import Moya

// MARK: - Protocol

protocol QRCodesApiSubServiceProtocol {
    func getMyBooked() async throws -> QRCode
    func tableId(_ request: QRCodTableResponse) async throws -> QRCodTableResponse
    func book(_ request: BookQrRequest) async throws -> Void
}

// MARK: - Service


extension NewApiService: QRCodesApiSubServiceProtocol {
    func getMyBooked() async throws -> QRCode {
        try await requestDecodable(QRCodesyTarget.getMyBooked)
    }
    
    func book(_ request: BookQrRequest) async throws {
        try await requestVoid(QRCodesyTarget.book(request))
    }
    
    func tableId(_ request: QRCodTableResponse) async throws -> QRCodTableResponse {
        try await requestDecodable(QRCodesyTarget.tableId(request))
    }
}

// MARK: - Target

enum QRCodesyTarget: CustomType {
    case getMyBooked
    case book(_ request: BookQrRequest)
    case tableId(_ request: QRCodTableResponse)

    // MARK: - Props
   
    var path: String {
        switch self {
        case .getMyBooked:
            return "/table"
        case .book:
            return "/table/book"
        case .tableId:
            return "/table/2"
        }
    }

    var method: Method {
        switch self {
        case .getMyBooked:
            return .get
        case .book:
            return .post
        case .tableId:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .getMyBooked:
            return .requestPlain
        case .book(let request):
            return .requestJSONEncodable(request)
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
        .bearer
    }
}
