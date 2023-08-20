//
//  MenuDishesCollectionViewCell.swift
//  NeoCafe
//
//  Created by Adinay on 31/7/23.
//

import Kingfisher
import SnapKit
import SwiftBoost
import UIKit

final class MenuDishesCollectionViewCell: UICollectionViewCell {
    // MARK: Props

    struct Props: Hashable {
        let imageUrl: String
        let title: String
        let description: String
        let price: String
    }

    // MARK: - Private Props

    private var props: Props?

    // MARK: - Views

    private lazy var imageView = UIImageView().do {
        $0.clipsToBounds = true
        $0.roundCorners(curve: .continuous, radius: 24.0)
        $0.contentMode = .scaleAspectFill
    }

    private lazy var titleLabel = UILabel()
    private lazy var descriptionLabel = UILabel()
    private lazy var priceLabel = UILabel()

    private lazy var labelsStackView = UIStackView(
        arrangedSubviews: [
            titleLabel,
            descriptionLabel,
            priceLabel
        ]
    ).do {
        $0.spacing = 8.0
        $0.axis = .vertical
    }

    // MARK: - LifeCycle

    override init(frame: CGRect) {
        super.init(frame: frame)

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

extension MenuDishesCollectionViewCell {
    func render(_ props: Props) {
        guard self.props != props else { return }
        self.props = props

        imageView.kf.setImage(with: URL(string: props.imageUrl))
        titleLabel.text = props.title
        descriptionLabel.text = props.description
        priceLabel.text = props.price
    }
}

// MARK: - Private Methods

private extension MenuDishesCollectionViewCell {
    // Настройка View
    func setup() {
        backgroundColor = .clear
    }

    // Добавление Views
    func setupViews() {
        addSubviews(imageView, labelsStackView)
    }

    // Установка констреинтов
    func setupConstraints() {
        imageView.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview()
            $0.size.equalTo(CGSize(width: 89, height: 89))
        }

        labelsStackView.snp.makeConstraints {
            $0.leading.equalTo(imageView.snp.trailing).offset(16.0)
            $0.top.bottom.trailing.equalToSuperview()
        }
    }
}

// MARK: - Constants

private extension MenuDishesCollectionViewCell {
    enum Constants {
    }
}
