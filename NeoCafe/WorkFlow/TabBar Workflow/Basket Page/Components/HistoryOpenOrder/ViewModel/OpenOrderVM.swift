//
//  OpenOrderVM.swift
//  NeoCafe
//
//  Created by Adinay on 8/8/23.
//

import Foundation

final class OpenOrderVM {
    private let apiService: BasketApiSubServiceProtocol = NewApiService.shared

    func fetchOrders(completion: @escaping @MainActor (BasketOrdersResponse) -> Void) {
        Task {
            do {
                let response = try await apiService.fetchOrders()
                await completion(response)
            } catch {
                debugPrint(error)
            }
        }
    }
}
