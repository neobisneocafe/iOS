//
//  MenuViewController.swift
//  NeoCafe
//
//  Created by Adinay on 31/7/23.
//

import Combine
import UIKit

final class MenuViewController: UIViewController {
    // MARK: - Private Props

    private lazy var moduleView = MenuView()

    private let viewModel: MenuViewModel

    private let viewDidLoadSubject = PassthroughSubject<Void, Never>()

    // MARK: - LifeCicle

    init(viewModel: MenuViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = moduleView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        binding()
        viewDidLoadSubject.send()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
    }

    // MARK: - Private Methods

    private func configureNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        navigationItem.rightBarButtonItem = .init(systemItem: .add)

        navigationController?.navigationBar.tintColor = UIColor(named: "blue")

        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor(named: "blue") ?? .black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(named: "blue") ?? .black]
        navigationItem.standardAppearance = appearance

        title = "Меню"
    }

    private func binding() {
        let output = viewModel.binding(
            .init(
                viewDidLoad: viewDidLoadSubject.eraseToAnyPublisher(),
                tapOnCategory: moduleView.tapOnCategory.eraseToAnyPublisher(),
                tapOnDishes: moduleView.tapOnDishes.eraseToAnyPublisher()
            )
        )

        output.obtainedData
            .receive(on: RunLoop.main)
            .sink { error in
                debugPrint(error)
            } receiveValue: { [weak self] responses in
                self?.moduleView.render(
                    .init(
                        categoryItems: responses.category.data.map {
                            .category(
                                .init(
                                    title: $0.name ?? "",
                                    isSelected: responses.category.selectedId == $0.id
                                )
                            )
                        },
                        dishesItems: responses.dishes.map {
                            .dishes(
                                .init(
                                    imageUrl: $0.image?.url ?? "",
                                    title: $0.name ?? "",
                                    description: $0.description ?? "",
                                    price: $0.price ?? ""
                                )
                            )
                        }
                    )
                )
            }
            .store(in: &viewModel.store)
    }
}
