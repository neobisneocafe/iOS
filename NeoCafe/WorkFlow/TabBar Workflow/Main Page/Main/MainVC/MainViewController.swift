//
//  MainViewController.swift
//  NeoCafe
//
//  Created by Adinay on 8/6/23.
//

import UIKit
import SnapKit


class MainViewController: BaseViewController {
    
    enum Section {
        case header
        case menu
        case popular
        
        var title: String {
            switch self {
            case .header:
                return ""
            case .menu:
                return "Наше меню"
            case .popular:
                return "Популярное"
            }
        }
    }
    
  private lazy var searchController = UISearchController(searchResultsController: nil)
   
    private lazy var pushButton: UIButton = {
        let button = UIButton()
        button.setImage(.init(named: "push"), for: .normal)
        button.addTarget(self, action: #selector(pushTap), for: .touchUpInside)
        button.isUserInteractionEnabled = true
        return button
    }()
    
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero,
                                    collectionViewLayout: makeCollectionLayout())
        
        view.dataSource = self
        view.delegate = self
        view.register(MenuCell.self, forCellWithReuseIdentifier: "TestCell")
        view.register(PopularCell.self, forCellWithReuseIdentifier: "PopularCell")
        view.register(TestHeaderView.self,
                      forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                      withReuseIdentifier: "TestHeaderView")
        return view
    }()
    
    private let sections: [Section] = [.header, .menu, .popular]
    
    private let viewModel = CategoryDishesViewModel()

    private var categoryItems: [CategoryListItem] = []
    
    private let viewModelDish = DishDetailsVM()
    
    private var addonsItems: [AddonDishesResponseElement] = []

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchCategory { [weak self] items in
            self?.categoryItems = items
            self?.collectionView.reloadData()

        }
        
        viewModelDish.fetchAddons { [weak self] items in
           
            self?.addonsItems = items
            self?.collectionView.reloadData()
            
        }
    }
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = .white
        self.view.addSubview(searchController.searchBar)
        self.view.addSubview(pushButton)
        self.view.addSubview(collectionView)
    }
    
    override func setupConstrains() {
        searchController.searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(computedHeight(26))
            make.leading.equalToSuperview().offset(computedWidth(16))
            make.height.equalTo(computedHeight(48))
            make.width.equalTo(computedWidth(296))
        }
        pushButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(computedHeight(40))
            make.trailing.equalToSuperview().inset(computedWidth(16))
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(searchController.searchBar.snp.bottom).offset(computedHeight(20))
            make.leading.trailing.equalToSuperview().inset(computedWidth(0))
            make.bottom.equalToSuperview().offset(computedHeight(0))
        }
    }
}

// MARK: - UICollectionViewDataSource

extension MainViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return categoryItems.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let section = sections[indexPath.section]
        
        if section == .header {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TestCell", for: indexPath)
            return cell
        } else if section == .menu {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TestCell", for: indexPath) as? MenuCell else { return UICollectionViewCell() }
            cell.configure(imageUrl: categoryItems[safe: indexPath.row]?.imageUrl ?? nil)
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCell", for: indexPath) as? PopularCell else { return UICollectionViewCell() }
            print(addonsItems)
//            let item = addonsItems[indexPath.row]
//            cell.setup(item: item)
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "TestHeaderView", for: indexPath)
        let title = sections[indexPath.section].title
        (header as? TestHeaderView)?.display(title)
        return header
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(MenuAssembly.create(), animated: true)
    }
}

// MARK: - Configure UICollectionViewCompositionalLayout

extension MainViewController {
    private func makeCollectionLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { [unowned self] index, _ in
            switch sections[index] {
            case .header:
                return self.makeHeaderSectionLayout()
            case .menu:
                return self.makeMenuSectionLayout()
            case .popular:
                return self.makePopularItemsSectionLayout()
            }
        }
        return layout
    }
    
    
    private func makeHeaderSectionLayout() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            )
        )
        
        item.contentInsets = .init(top: 0, leading: 16,
                                   bottom: 0, trailing: 16)
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(127)
            ),
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
    private func makeMenuSectionLayout() -> NSCollectionLayoutSection {
        let bigItem = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(0.5),
                heightDimension: .absolute(134)
            )
        )
        
        bigItem.contentInsets = .init(top: 8, leading: 8,
                                      bottom: 8, trailing: 8)
        let bigGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(134)
            ),
            subitems: [bigItem]
        )
        
        let smallItem = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(0.333),
                heightDimension: .absolute(134)
            )
        )
        
        smallItem.contentInsets = .init(top: 8, leading: 8,
                                        bottom: 8, trailing: 8)
        let smallGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(134)
            ),
            subitems: [smallItem]
        )
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(268)
            ),
            subitems: [bigGroup, smallGroup]
        )
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 0, leading: 8,
                                      bottom: 0, trailing: 8)
        section.boundarySupplementaryItems = [makeHeader()]
        return section
    }
    private func makePopularItemsSectionLayout() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            )
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(89)
            ),
            subitems: [item]
        )
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 18
        section.contentInsets = .init(top: 8, leading: 16,
                                      bottom: 24, trailing: 16)
        section.boundarySupplementaryItems = [makeHeader()]
        return section
    }
    
    private func makeHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(.zero)
        )
        let headerElement = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        return headerElement
    }
}


// MARK: - Selectors

extension MainViewController {
    @objc func pushTap() {
       
    }
}
