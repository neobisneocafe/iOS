//
//  OpenOrderTableViewCell.swift
//  NeoCafe
//
//  Created by Adinay on 30/6/23.
//

import UIKit
import SnapKit
import Kingfisher

class OpenOrderTableViewCell: UITableViewCell {
    
    // MARK: Props
    
    struct Props {
        let isCompleted: Bool
        let mainImageUrl: String?
        let name: String
        let price: String
        let description: String
        let sumTotal: String?
        let date: String
    }
    
    static let identifier = "OpenOrderTableViewCell"
    
    private lazy var mainImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "coffee")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private lazy var nameLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Капучино"
        lb.textColor = UIColor(named: "blue")
        lb.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return lb
    }()
    
    private lazy var sumLabel: UILabel = {
        let lb = UILabel()
        lb.text = "(190 с за шт)"
        lb.textColor = .black
        lb.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return lb
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let lb = UILabel()
        lb.text = "коровье молоко"
        lb.textColor = UIColor(named: "black")
        lb.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return lb
    }()
    
    private lazy var sumTotalLabel: UILabel = {
        let lb = UILabel()
        lb.text = "190 с"
        lb.textColor = UIColor(named: "FF8B5B")
        lb.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return lb
    }()
    
    private lazy var stepperControl: RoundStepperView = {
        let stepper = RoundStepperView()
        stepper.minimumNumberOfItems = 0
        stepper.additionButtonColor = UIColor(named: "FF8B5B") ?? .orange
        stepper.decreaseButtonColor = UIColor(named: "gray-2") ?? .systemGray
        stepper.delegate = self
        return stepper
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods

    func render(_ props: Props) {
        if let imageUrl = props.mainImageUrl {
            mainImage.kf.setImage(with: URL(string: imageUrl), placeholder: UIImage(named: "coffee"))
        }
        nameLabel.text = props.name
        sumLabel.text = props.price
        descriptionLabel.text = props.description
        sumTotalLabel.text = props.price
        stepperControl
    }
    
    private func setUp() {
        setupViews()
        setupConstrains()
    }
    
    private func setupViews() {
        contentView.backgroundColor = .white
        contentView.addSubview(mainImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(sumLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(sumTotalLabel)
        contentView.addSubview(stepperControl)
    }
    
    private func setupConstrains() {
        mainImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(computedHeight(22))
            make.leading.equalToSuperview().offset(computedWidth(16))
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(computedHeight(26))
            $0.leading.equalTo(mainImage.snp.trailing).offset(computedWidth(16))
            $0.height.equalTo(computedHeight(22))
        }
        
        sumLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(computedHeight(30))
            $0.trailing.equalToSuperview().inset(computedWidth(72))
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(computedHeight(8))
            $0.leading.equalTo(mainImage.snp.trailing).offset(computedWidth(16))
        }
        
        sumTotalLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(computedHeight(42))
            $0.trailing.equalToSuperview().inset(computedWidth(12))
        }
        
        stepperControl.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(computedHeight(58))
            make.height.equalTo(computedHeight(24))
            make.trailing.equalToSuperview().inset(computedWidth(16))
            make.width.equalTo(computedWidth(94))
        }
    }
}



// MARK: - HidableStepperDelegate

extension OpenOrderTableViewCell: HidableStepperDelegate {
    func stepperWillHideDecreaseButton() {
        
    }
    
    func stepperWillRevealDecreaseButton() {
        
    }
    
    func updateValue(with count: Int) {
        
    }
}
