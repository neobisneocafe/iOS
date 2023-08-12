//
//  HorizontalMenuCollectionViewCell.swift
//  NeoCafe
//
//  Created by Adinay on 6/7/23.
//

import UIKit
import SnapKit

//class HorizontalMenuCollectionViewCell: UICollectionViewCell {
//     let nameCategoryLabel: UILabel = {
//        let lb = UILabel()
//        lb.textAlignment = .center
//        lb.textColor = .white
//        lb.font = UIFont(name: "Arial Bold", size: 18)
//         lb.translatesAutoresizingMaskIntoConstraints = false
//        return lb
//    }()
//    
//    override var isSelected: Bool {
//        didSet {
//            backgroundColor = isSelected ? UIColor(red: 0.157, green: 0.224, blue: 0.322, alpha: 1) : UIColor.clear
//            nameCategoryLabel.textColor = isSelected ? .black : .white
//        }
//    }
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setup()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private func setup () {
//        setupViews()
//        setupConstrainst()
//    }
//    
//    private func setupViews() {
//        backgroundColor = .systemBlue
//        addCornerRadius(10)
//        addSubview(nameCategoryLabel)
//    }
//    
//    private func setupConstrainst() {
//        NSLayoutConstraint.activate([
//            nameCategoryLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
//            nameCategoryLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
//        ])
//    }
//}
