//
//  HistoryOfOrdersTableViewCell.swift
//  NeoCafe
//
//  Created by Adinay on 2/7/23.
//

import UIKit
import SnapKit
import Kingfisher

class HistoryOfOrdersTableViewCell: UITableViewCell {
    
    struct Props {
        let id: Int
        let isCompleted: Bool
        let branchImageUrl: String?
        let branch: String
        let products: String
        let date: String
    }
    
    static let identifier = "HistoryOfOrdersTableViewCell"
    
    private lazy var branchImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "actual")
        view.layer.cornerRadius = 24
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
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
    
    // MARK: - LifeCycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods

    func render(_ props: Props) {
        if let imageUrl = props.branchImageUrl {
            branchImage.kf.setImage(with: URL(string: imageUrl), placeholder: UIImage(named: "actual"))
        }
        branchLabel.text = props.branch
        productsLabel.text = props.products
        dateLabel.text = props.date
    }
    
    // MARK: - Private Methods
    
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
        branchImage.snp.makeConstraints {make in
            branchImage.snp.makeConstraints {
                $0.top.leading.bottom.equalToSuperview().inset(
                    UIEdgeInsets(
                        top: 8.0,
                        left: 16.0,
                        bottom: 8.0,
                        right: 0.0
                    )
                )

                $0.size.equalTo(89)
            }
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
