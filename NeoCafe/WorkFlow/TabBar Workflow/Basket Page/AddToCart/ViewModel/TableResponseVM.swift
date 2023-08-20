//
//  TableResponseVM.swift
//  NeoCafe
//
//  Created by Adinay on 18/8/23.
//

import Foundation

final class TableResponseVM {
    private let apiService: BasketApiSubServiceProtocol = NewApiService.shared

    func fetchTableOrders(requst: TableOrdersRequest, branchId: Int, completion: @escaping @MainActor (TableOrdersResponse) -> Void) {
        Task {
            do {
                let response = try await apiService.fetchTableOrders(requst, branchId: branchId)
                await completion(response)
            } catch {
                debugPrint(error)
            }
        }
    }
}
