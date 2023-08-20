//
//  CompletedOrderVM.swift
//  NeoCafe
//
//  Created by Adinay on 11/8/23.
//

import Foundation

final class CompletedOrderVM {
    private let apiService: BasketApiSubServiceProtocol = NewApiService.shared

    func fetchOrdersCompleted(id: Int, completion: @escaping @MainActor (BasketOrdersResponseElement) -> Void) {
        Task {
            do {
                let response = try await apiService.fetchOrders(id)
                await completion(response)
            } catch {
                debugPrint(error)
            }
        }
    }
}
