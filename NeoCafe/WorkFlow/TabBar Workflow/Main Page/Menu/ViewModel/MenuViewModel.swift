//
//  MenuViewModel.swift
//  NeoCafe
//
//  Created by Adinay on 31/7/23.
//

import Combine
import Foundation

final class MenuViewModel {
    // MARK: - Internal Props

    var store: Set<AnyCancellable> = []

    // MARK: - Private Props

    private let router: MenuRouter
    private let categoryApiService: CategoryApiSubServiceProtocol = NewApiService.shared
    private let dishesApiService: DishesApiSubServiceProtocol = NewApiService.shared

    private var category: [CategoryListItem] = []
    private var dishes: [DishesListItem] = []
    private let dataSubject = PassthroughSubject<(category: (data: [CategoryListItem], selectedId: Int), dishes: [DishesListItem]), Error>()

    // MARK: - LifeCycle

    init(router: MenuRouter) {
        self.router = router
    }
}

// MARK: - In / Out

extension MenuViewModel {
    struct Input {
        let viewDidLoad: AnyPublisher<Void, Never>
        let tapOnCategory: AnyPublisher<Int, Never>
        let tapOnDishes: AnyPublisher<Int, Never>
    }

    struct Output {
        let obtainedData: AnyPublisher<(category: (data: [CategoryListItem], selectedId: Int), dishes: [DishesListItem]), Error>
    }
}

// MARK: - Public Methods

extension MenuViewModel {
    func binding(_ input: Input) -> Output {
        input.viewDidLoad
            .sink { [weak self] in
                self?.obtainData()
            }
            .store(in: &store)

        input.tapOnCategory
            .sink { [weak self] index in
                self?.filterForDishes(index)
            }
            .store(in: &store)

        input.tapOnDishes
            .sink { index in
                debugPrint(index)
            }
            .store(in: &store)

        return .init(
            obtainedData: dataSubject.eraseToAnyPublisher()
        )
    }
}

// MARK: - Private Methods

private extension MenuViewModel {
    func obtainData() {
        Task { [weak self] in
            do {
                let categoryResponse = try await self?.categoryApiService.obtainList(.init(page: 1, limit: 99))
                let dishesResponse = try await self?.dishesApiService.obtainList(.init(page: 1, limit: 99))

                self?.category = categoryResponse?.data ?? []
                self?.dishes = dishesResponse?.data ?? []

                self?.filterForDishes()
            } catch {
                self?.dataSubject.send(completion: .failure(error))
            }
        }
    }

    func filterForDishes(_ index: Int = 0) {
        let currentCategory = category[index]
        let dishes = dishes.filter { $0.category?.id == currentCategory.id }

        dataSubject.send(((category, currentCategory.id ?? -1), dishes))
    }
}
