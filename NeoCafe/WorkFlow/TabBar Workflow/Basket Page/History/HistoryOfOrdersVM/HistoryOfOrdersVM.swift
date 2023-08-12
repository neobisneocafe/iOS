//
//  HistoryOfOrdersVM.swift
//  NeoCafe
//
//  Created by Adinay on 8/8/23.
//

import Foundation

final class HistoryOfOrdersVM {
    private let apiService: BasketApiSubServiceProtocol = NewApiService.shared

    func fetchHistory(completion: @escaping @MainActor (BasketHistoryResponse) -> Void) {
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
