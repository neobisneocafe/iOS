//
//  MenuCategoryCollectionViewCell.swift
//  NeoCafe
//
//  Created by Adinay on 31/7/23.
//

import SnapKit
import SwiftBoost
import UIKit

final class MenuCategoryCollectionViewCell: UICollectionViewCell {
    // MARK: Props

    struct Props: Hashable {
        let title: String
        let isSelected: Bool
    }

    // MARK: - Private Props

    private var props: Props?

    // MARK: - Views

    private lazy var mainLabel = UILabel().do {
        $0.font = .systemFont(ofSize: 16.0)
        $0.textAlignment = .center
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

extension MenuCategoryCollectionViewCell {
    func render(_ props: Props) {
        guard self.props != props else { return }
        self.props = props

        mainLabel.text = props.title

        if props.isSelected {
            mainLabel.textColor = .white
            backgroundColor = UIColor(named: "blue")
        } else {
            mainLabel.textColor = UIColor(named: "gray2")
            backgroundColor = .clear
        }
    }
}

// MARK: - Private Methods

private extension MenuCategoryCollectionViewCell {
    /// Настройка View
    func setup() {
        backgroundColor = .clear

        roundCorners(curve: .continuous, radius: frame.height / 2)
    }

    /// Добавление Views
    func setupViews() {
        addSubview(mainLabel)
    }

    /// Установка констреинтов
    func setupConstraints() {
        mainLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 8.0, left: 16.0, bottom: 8.0, right: 16.0))
        }
    }
}

// MARK: - Constants

private extension MenuCategoryCollectionViewCell {
    enum Constants {
    }
}
