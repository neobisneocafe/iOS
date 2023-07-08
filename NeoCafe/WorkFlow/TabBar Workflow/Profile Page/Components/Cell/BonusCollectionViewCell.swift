//
//  BonusTableViewCell.swift
//  NeoCafe
//
//  Created by Adinay on 20/6/23.
//

import UIKit
import SnapKit

class BonusCollectionViewCell: UICollectionReusableView {
 
//    static let identifier = "BonusCollectionViewCell"
    
    private lazy var bonusesImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "bonuses")
        iv.isUserInteractionEnabled = true
        let imageTap = UITapGestureRecognizer(target: self, action: #selector(bonusesTap))
        iv.addGestureRecognizer((imageTap))
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTable()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTable() {
        setupViews()
        setupConstrains()
    }
    private func setupViews() {
        addSubview(bonusesImage)
    }
    
    private func  setupConstrains() {
        bonusesImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(computedWidth(10))
            make.height.equalTo(computedHeight(128))
        }
        
    }
}

// MARK: - Selector

extension BonusCollectionViewCell {
    @objc func bonusesTap() {
        print("bonuses")
    }
}
