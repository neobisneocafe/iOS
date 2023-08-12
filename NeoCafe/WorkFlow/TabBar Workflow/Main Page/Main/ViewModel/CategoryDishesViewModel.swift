//
//  CategoryDishesViewModel.swift
//  NeoCafe
//
//  Created by Adinay on 28/7/23.
//

import Foundation

class CategoryDishesViewModel {
    var dishes = DishesResponse()

    private let apiService: CategoryApiSubServiceProtocol = NewApiService.shared

    func fetchCategory(completion: @escaping @MainActor ([CategoryListItem]) -> Void) {
        Task {
            do {
                let response = try await apiService.obtainList(.init(page: 1, limit: 5))
                guard let items = response.data else {
                    await completion([])
                    return
                }

                await completion(items)
            } catch {
                debugPrint(error)
                await completion([])
            }
        }
    }
}
