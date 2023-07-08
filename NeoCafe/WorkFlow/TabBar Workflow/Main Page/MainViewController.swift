//
//  MainViewController.swift
//  NeoCafe
//
//  Created by Adinay on 8/6/23.
//

import UIKit

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
    
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero,
                                    collectionViewLayout: makeCollectionLayout())
        
        view.dataSource = self
        view.register(TestCell.self, forCellWithReuseIdentifier: "TestCell")
        view.register(TestHeaderView.self,
                      forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                      withReuseIdentifier: "TestHeaderView")
        return view
    }()
    
    private let sections: [Section] = [.header, .menu, .popular]
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = .white
        
    }
    
    override func setupConstrains() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension MainViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 5
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let section = sections[indexPath.section]
        
        if section == .header {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TestCell", for: indexPath)
            return cell
        } else if section == .menu {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TestCell", for: indexPath)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TestCell", for: indexPath)
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
 
// MAKR: - Configure UICollectionViewCompositionalLayout
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
