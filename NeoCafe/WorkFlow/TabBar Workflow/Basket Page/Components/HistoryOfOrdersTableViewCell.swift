//
//  HistoryOfOrdersTableViewCell.swift
//  NeoCafe
//
//  Created by Adinay on 2/7/23.
//

import UIKit
import SnapKit

class HistoryOfOrdersTableViewCell: UITableViewCell {
    static let identifier = "HistoryOfOrdersTableViewCell"
    
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        setupViews()
        setupConstrains()
    }
    
    private func setupViews() {
        contentView.backgroundColor = .white
        addSubview(branchImage)
        addSubview(branchLabel)
        addSubview(productsLabel)
        addSubview(dateLabel)
    }
    
    private func setupConstrains() {
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
