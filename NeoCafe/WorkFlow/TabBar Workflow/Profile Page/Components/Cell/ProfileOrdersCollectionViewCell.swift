//
//  ProfileOrdersTableViewCell.swift
//  NeoCafe
//
//  Created by Adinay on 21/6/23.
//

import UIKit
import SnapKit

class ProfileOrdersCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ProfileOrdersCollectionViewCell"
    
    private lazy var branchImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "actual")
        view.layer.cornerRadius = 24
        return view
    }()
    
    private lazy var branchLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .black
        label.text = "NeoCafe Dzerzhinka"
        return label
    }()
    
    private lazy var productsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.text = "Латте, Капучино, Багров..."
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "14 августа"
        label.textColor = .darkGray
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setUp()
    }
    
    private func setUp() {
        backgroundColor = .white
        setUpSubviews()
        setUpConstaints()
    }
    
    private func setUpSubviews() {
        addSubview(branchImage)
        addSubview(branchLabel)
        addSubview(productsLabel)
        addSubview(dateLabel)
    }
    
    private func setUpConstaints () {
        branchImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(computedHeight(8))
            $0.leading.equalToSuperview().offset(computedWidth(16))
            $0.bottom.equalToSuperview().offset(computedHeight(-8))
        }
        branchLabel.snp.makeConstraints {
            $0.top.equalTo(branchImage).offset(computedHeight(20))
            $0.leading.equalTo(branchImage.snp.trailing).offset(computedWidth(16))
            $0.height.equalTo(computedHeight(22))
            $0.trailing.equalToSuperview().offset(computedWidth(-16))
        }
        productsLabel.snp.makeConstraints {
            $0.top.equalTo(branchLabel.snp.bottom).offset(computedHeight(16))
            $0.leading.equalTo(branchImage.snp.trailing).offset(computedWidth(16))
            $0.height.equalTo(computedHeight(22))
            $0.trailing.equalTo(dateLabel.snp.leading).offset(computedWidth(-16))
        }
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(productsLabel)
            $0.width.greaterThanOrEqualTo(computedWidth(14))
            $0.trailing.equalToSuperview().offset(computedWidth(-16))
            $0.height.equalTo(computedHeight(22))
        }
    }
    
}


extension ProfileViewController {
    enum HeaderType: String {
        case current = "Актуальный заказ"
        case closed = "Завершенные"
    }
    
    class Header: UICollectionReusableView {
        private lazy var titleLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
            label.text = "Актуальный заказ"
            label.textColor = UIColor(named: "blue")
            return label
        }()
        
        override func layoutSubviews() {
            super.layoutSubviews()
            setUp()
        }
        
        func display(with text: HeaderType) {
            titleLabel.text = text.rawValue
        }
        
        private func setUp() {
            setUpSubviews()
            setUpConstaints()
        }
        
        private func setUpSubviews() {
            addSubview(titleLabel)
        }
        
        private func setUpConstaints () {
            titleLabel.snp.makeConstraints { make in
                make.top.leading.equalToSuperview().offset(computedWidth(16))
                make.trailing.bottom.equalToSuperview().offset(-16)
            }
        }
    }
}

