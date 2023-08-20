//
//  NewApiService.swift
//  NeoCafe
//
//  Created by Adinay on 31/7/23.
//

import Foundation
import Moya

struct NewApiService {
    // MARK: - Shared

    static let shared = NewApiService()

    // MARK: - LifeCycle

    private init() { }

    // MARK: - Public Methods

    func requestDecodable<CT: CustomType, D: Decodable>(_ type: CT) async throws -> D {
        let provider = fetchProvider(type)

        return try await withCheckedThrowingContinuation { continuation in
            provider.request(type) { result in
                do {
                    switch result {
                    case .success(let response):
                        continuation.resume(returning: try response.filterSuccessfulStatusAndRedirectCodes().map(D.self))

                    case .failure(let error):
                        continuation.resume(throwing: error)
                    }
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    func requestData<CT: CustomType>(_ type: CT) async throws -> Data {
        let provider = fetchProvider(type)

        return try await withCheckedThrowingContinuation { continuation in
            provider.request(type) { result in
                switch result {
                case .success(let response):
                    continuation.resume(returning: response.data)

                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    func requestVoid<CT: CustomType>(_ type: CT) async throws {
        let provider = fetchProvider(type)

        return try await withCheckedThrowingContinuation { continuation in
            provider.request(type) { result in
                switch result {
                case .success:
                    continuation.resume()

                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    // MARK: - Private Methods

    private func fetchProvider<CT: CustomType>(_ type: CT) -> MoyaProvider<CT> {
        MoyaProvider(
            plugins: [
                AccessTokenPlugin(
                    tokenClosure: { type in
                        DataStoreUserDefaults.shared.getAccessToken() ?? ""
                    }
                ),
                NetworkLoggerPlugin()
            ]
        )
    }
}
