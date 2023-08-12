//
//  ProfileViewModel.swift
//  NeoCafe
//
//  Created by Adinay on 10/8/23.
//

import Foundation

final class ProfileOrderViewModel {
    
    private let apiService: BasketApiSubServiceProtocol = NewApiService.shared

    func fetchOrders(completion: @escaping @MainActor (BasketHistoryResponse) -> Void) {
        Task {
            do {
                let response = try await apiService.fetchHistory()
                await completion(response)
            } catch {
                debugPrint(error)
            }
        }
    }
}
