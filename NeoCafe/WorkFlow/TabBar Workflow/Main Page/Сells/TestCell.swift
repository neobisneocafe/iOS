//
//  TestCell.swift
//  NeoCafe
//
//  Created by Adinay on 10/6/23.
//

import Kingfisher
import SnapKit
import SwiftBoost
import UIKit

class TestCell: UICollectionViewCell {
    // MARK: - Views

    private lazy var imageView = UIImageView().do {
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        $0.isHidden = true
        $0.roundCorners(curve: .circular, radius: 10.0)
    }

    // MARK: - LifeCicle

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .gray
        layer.cornerRadius = 10
        layer.masksToBounds = true

        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        contentView.addSubviews(imageView)

        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    func configure(imageUrl: String?) {
        guard let imageUrl else {
            imageView.isHidden = true
            return
        }

        imageView.isHidden = false
        imageView.kf.setImage(with: imageUrl.getURL())
    }
}
