//
//  BonusOrderVM.swift
//  NeoCafe
//
//  Created by Adinay on 16/8/23.
//

import Foundation

final class BonusOrderVM {
    private let apiService: BonusesSubServiceProtocol = NewApiService.shared

    func fetchBonuses(completion: @escaping @MainActor (BonusesOrdersResponseElement) -> Void) {
        Task {
            do {
                let response = try await apiService.fetchBonuses()
                await completion(response)
            } catch {
                debugPrint(error)
            }
        }
    }
}
