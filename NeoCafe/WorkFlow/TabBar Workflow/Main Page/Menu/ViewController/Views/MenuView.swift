//
//  MenuView.swift
//  NeoCafe
//
//  Created by Adinay on 31/7/23.
//

import Combine
import SnapKit
import SwiftBoost
import UIKit

final class MenuView: UIView {
    // MARK: Props

    struct Props: Equatable {
        let categoryItems: [MenuCollectionCell]
        let dishesItems: [MenuCollectionCell]
    }

    enum Section: Int {
        case categories
        case dishes
    }

    enum MenuCollectionCell: Hashable {
        case category(MenuCategoryCollectionViewCell.Props)
        case dishes(MenuDishesCollectionViewCell.Props)
    }

    // MARK: - Internal Props

    var tapOnCategory = PassthroughSubject<Int, Never>()
    var tapOnDishes = PassthroughSubject<Int, Never>()

    // MARK: - Private Props

    private var props: Props?

    private lazy var dataSource: UICollectionViewDiffableDataSource<Section, MenuCollectionCell> = .init(collectionView: collectionView) { collectionView, indexPath, item in
        switch item {
        case .category(let props):
            let cell = collectionView.dequeueReusableCell(withClass: MenuCategoryCollectionViewCell.self, for: indexPath)
            cell.render(props)
            return cell

        case .dishes(let props):
            let cell = collectionView.dequeueReusableCell(withClass: MenuDishesCollectionViewCell.self, for: indexPath)
            cell.render(props)
            return cell
        }
    }

    // MARK: - Views

    private lazy var collectionView: UICollectionView = {
        let compositionalLayout = UICollectionViewCompositionalLayout { sectionIndex, _ in
            switch sectionIndex {
            case Section.categories.rawValue:
                return self.createHorizontalSectionLayout()

            case Section.dishes.rawValue:
                return self.createVerticalSectionLayout()

            default:
                return nil
            }
        }

        let collection = UICollectionView(frame: .zero, collectionViewLayout: compositionalLayout)

        collection.register(MenuCategoryCollectionViewCell.self)
        collection.register(MenuDishesCollectionViewCell.self)

        return collection
    }()

    // MARK: - LifeCycle

    init() {
        super.init(frame: .zero)

        setup()
        setupViews()
        setupConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Internal Methods

extension MenuView {
    func render(_ props: Props) {
        guard self.props != props else { return }
        self.props = props

        var snapshot = NSDiffableDataSourceSnapshot<Section, MenuCollectionCell>()
        snapshot.appendSections([.categories, .dishes])
        snapshot.appendItems(props.categoryItems, toSection: .categories)
        snapshot.appendItems(props.dishesItems, toSection: .dishes)
        dataSource.apply(snapshot)
    }
}

// MARK: - Private Methods

private extension MenuView {
    /// Настройка View
    func setup() {
        backgroundColor = .white

        collectionView.delegate = self
    }

    /// Добавление Views
    func setupViews() {
        addSubview(collectionView)
    }

    /// Установка констреинтов
    func setupConstraints() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    func createHorizontalSectionLayout() -> NSCollectionLayoutSection {
        // Создаем элемент (ячейку) для вертикальной секции
        let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(140.0), heightDimension: .absolute(32.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        // Создаем группу (горизонтальную стек) с элементами
        let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(1.0), heightDimension: .absolute(32.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        // Создаем секцию с группой
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 0.0, leading: 16.0, bottom: 0.0, trailing: 16.0)
        section.interGroupSpacing = 16.0
        section.orthogonalScrollingBehavior = .continuous

        return section
    }

    func createVerticalSectionLayout() -> NSCollectionLayoutSection {
        // Создаем элемент (ячейку) для горизонтальной секции
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(89.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        // Создаем группу (вертикальный стек) с элементами
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(1.0))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        // Создаем секцию с группой
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 16.0, leading: 16.0, bottom: 16.0, trailing: 16.0)
        section.interGroupSpacing = 16.0

        return section
    }
}

extension MenuView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let section = Section(rawValue: indexPath.section) else { return }

        switch section {
        case .categories:
            tapOnCategory.send(indexPath.row)

        case .dishes:
            tapOnDishes.send(indexPath.row)
            
        }
    }
}

// MARK: - Constants

private extension MenuView {
    enum Constants {
    }
}
