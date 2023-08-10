//
//  HorizontalMenuCollectionView.swift
//  NeoCafe
//
//  Created by Adinay on 6/7/23.
//

import UIKit
protocol HorizontalMenuCollectionViewDelegate: AnyObject {
  func didTapCellMenu(with index: Int)
//    func horizontalMenuCollectionView(
//        _ horizontalMenuCollectionView: HorizontalMenuCollectionView,
//        didSelect categoryModel: CategoryModel
//    )
}

class HorizontalMenuCollectionView: UICollectionView {
    
    weak var delegateTap: HorizontalMenuCollectionViewDelegate?
    
    private let categoryLayout = UICollectionViewFlowLayout()
    private let nameCategoryArray = ["Кофе", "Десерты", "Выпечка", "Коктейли", "Чай"]
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: categoryLayout)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        categoryLayout.minimumInteritemSpacing = 32
        categoryLayout.scrollDirection = .horizontal
        
        backgroundColor = .none
        bounces = false
        showsHorizontalScrollIndicator = false
        delegate = self
        dataSource = self
        register(HorizontalMenuCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
}

// MARK: - UICollectionViewDataSource

extension HorizontalMenuCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        nameCategoryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? HorizontalMenuCollectionViewCell else { return UICollectionViewCell() }
        cell.nameCategoryLabel.text =  nameCategoryArray[indexPath.item]
        return cell
    }
}



// MARK: - UICollectionViewDelegate

extension HorizontalMenuCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
}


// MARK: - UICollectionViewFlowLayout

extension HorizontalMenuCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let categoryFont = UIFont(name: "Arial Bold", size: 18)
        let categoryAttributes = [NSAttributedString.Key.font : categoryFont as Any]
        let categoryWidth = nameCategoryArray[indexPath.item].size(withAttributes: categoryAttributes).width + 32
        
       return CGSize(width: categoryWidth,
               height: collectionView.frame.height)
    }
}
