//
//  DishDetailsVM.swift
//  NeoCafe
//
//  Created by Adinay on 17/8/23.
//

import Foundation

final class DishDetailsVM {
    private let apiService: DishesApiSubServiceProtocol = NewApiService.shared
    
    func fetchDish(id: Int, completion: @escaping @MainActor (DishesListItem) -> Void) {
        Task {
            do {
                let response = try await apiService.obtainDishesById(id)
                await completion(response)
            } catch {
                debugPrint(error)
            }
        }
    }

    func fetchAddons(completion: @escaping @MainActor (AddonDishesResponse) -> Void) {
        Task {
            do {
                let response = try await apiService.obtainAddonDishes()
                await completion(response)
            } catch {
                debugPrint(error)
            }
        }
    }
}
