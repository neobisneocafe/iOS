//
//  PopularCell.swift
//  NeoCafe
//
//  Created by Adinay on 18/8/23.
//

import UIKit
import SnapKit

protocol PopularCellDelegate: AnyObject {
    func updateItems(count: Int)
}

class PopularCell: UICollectionViewCell {
    
    weak var delegate: PopularCellDelegate?
    
    public lazy var nameImage: UIImageView = {
        let iv = UIImageView()
        iv.addCornerRadius(22)
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "coffee")
        iv.clipsToBounds = true
        iv.backgroundColor = .clear
        return iv
    }()
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 20)
        view.text = "Some Text"
        return view
    }()
    
    public lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Капучино"
        label.textColor = UIColor(red: 0.157, green: 0.224, blue: 0.322, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    public lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(red: 0.357, green: 0.357, blue: 0.439, alpha: 1)
        label.text = "Кофейный напиток"
        return label
    }()
    public lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "190 с"
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = UIColor(named: "FF8B5B")
        return label
    }()
    private lazy var stepperControl: RoundStepperView = {
        let stepper = RoundStepperView()
        stepper.minimumNumberOfItems = 0
        stepper.additionButtonColor = UIColor(named: "FF8B5B") ?? .orange
        stepper.decreaseButtonColor = UIColor(named: "gray-2") ?? .systemGray
        stepper.delegate = self
        return stepper
    }()
    
    func display(_ title: String) {
        titleLabel.text = title
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(item: AddonDishesResponseElement) {
        guard let name = item.name,
              let description = item.description,
              let price = item.price?.description
        else { return }
        
        nameLabel.text = name
        descriptionLabel.text = description
        priceLabel.text = price
    }
    
    private func setupViews() {
        contentView.addSubview(nameImage)
        contentView.addSubview(stepperControl)
        contentView.addSubview(nameLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(priceLabel)
    }
    
    private func setupConstrains() {
        nameImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(computedHeight(0))
            make.leading.equalToSuperview().inset(computedWidth(4))
            make.height.equalTo(computedHeight(88))
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(computedHeight(8))
            make.leading.equalTo(nameImage.snp.trailing).offset(computedWidth(14))
        }
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(computedHeight(8))
            $0.leading.equalTo(nameImage.snp.trailing).offset(computedWidth(14))
        }
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(computedHeight(8))
            $0.leading.equalTo(nameImage.snp.trailing).offset(computedWidth(14))
        }
        stepperControl.snp.makeConstraints {
            $0.top.equalToSuperview().offset(computedHeight(50))
            $0.trailing.equalToSuperview().offset(computedWidth(-16))
            $0.height.equalTo(computedHeight(28))
            $0.width.equalTo(computedWidth(94))
        }
    }
}


// MARK: - HidableStepperDelegate

extension PopularCell: HidableStepperDelegate {
    func stepperWillHideDecreaseButton() { }
    func stepperWillRevealDecreaseButton() { }
    
    func updateValue(with count: Int) {
//        guard let dish = dish else { return }
//        delegate?.updateItems(with: dish, count: count)
    }
}
