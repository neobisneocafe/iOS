//
//  DishDetailsVM.swift
//  NeoCafe
//
//  Created by Adinay on 12/8/23.
//

import Foundation

final class DishDetailsVM {
    private let apiService: IngredientsSubServiceProtocol = NewApiService.shared
    
    func fetchDish (completion: @escaping @MainActor (IngredientResponseElement) -> Void) {
        Task {
            do {
                let response = try await apiService.fetchIngredient()
                await completion(response)
            } catch {
                debugPrint(error)
            }
        }
    }
}
