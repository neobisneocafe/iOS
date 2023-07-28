//
//  DishTableViewCell.swift
//  NeoCafe
//
//  Created by Adinay on 12/7/23.
//

import UIKit

protocol DishTableViewCellDelegate: AnyObject {
    func updateItems(count: Int)
}

class DishTableViewCell: UITableViewCell {
    static let identifier = "DishTableViewCell"
    
    weak var delegate: DishTableViewCellDelegate?
    
    public lazy var iv: UIImageView = {
        let iv = UIImageView()
        iv.addCornerRadius(22)
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "coffee")
        iv.clipsToBounds = true
        iv.backgroundColor = .clear
        return iv
    }()
    public lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Капучино"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(named: "F8F8F8")
        return label
    }()
    public lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(named: "gray-2")
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
        contentView.backgroundColor = UIColor(red: 0.254, green: 0.254, blue: 0.254, alpha: 1)
        contentView.addSubview(iv)
        contentView.addSubview(stepperControl)
        contentView.addSubview(nameLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(priceLabel)
    }
    
    private func setupConstrains() {
        iv.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(computedHeight(0))
            make.leading.equalToSuperview().inset(computedWidth(16))
            make.height.equalTo(computedHeight(88))
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(computedHeight(8))
            make.leading.equalTo(iv.snp.trailing).offset(computedWidth(14))
        }
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(computedHeight(8))
            $0.leading.equalTo(iv.snp.trailing).offset(computedWidth(14))
        }
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(computedHeight(8))
            $0.leading.equalTo(iv.snp.trailing).offset(computedWidth(14))
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

extension DishTableViewCell: HidableStepperDelegate {
    func stepperWillHideDecreaseButton() { }
    func stepperWillRevealDecreaseButton() { }
    
    func updateValue(with count: Int) {
//        guard let dish = dish else { return }
//        delegate?.updateItems(with: dish, count: count)
    }
}
