//
//  LocationsCell.swift
//  NeoCafe
//
//  Created by Adinay on 18/6/23.
//

import UIKit
import SnapKit
import Kingfisher
import SwiftDate

protocol LocationsCellDelegate: AnyObject {
    func didTapAppButton()
    func didTapPhoneNumBerButton()
}

class LocationsCell: UICollectionViewCell {
    static let identifier = "LocationsCell"
    
    weak var delegate: LocationsCellDelegate?
    
     lazy var locationImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.isUserInteractionEnabled = true
        iv.image = UIImage(named: "locations")
        return iv
    }()
    
    private lazy var openingTimeLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Сегодня: с 11:00 "
        lb.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        lb.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        return lb
    }()
    
    private lazy var closingTimeLabel: UILabel = {
        let lb = UILabel()
        lb.text = "до 22:00"
        lb.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        lb.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        return lb
    }()
    
     lazy var locationNameLabel: UILabel = {
        let lb = UILabel()
        lb.text = "NeoCafe Dzerzhinka"
        lb.textColor = UIColor(red: 0.983, green: 0.983, blue: 0.983, alpha: 1)
        lb.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        return lb
    }()
    
     lazy var adressLabel: UILabel = {
        let lb = UILabel()
        lb.text = "бульвар Эркиндик, 35"
        lb.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        lb.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return lb
    }()
    
    private lazy var adressImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "adress")
        return iv
    }()
    
    private lazy var phoneLabel: UILabel = {
        let lb = UILabel()
        lb.text = "0552 313 636"
        lb.textColor =  UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        lb.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        lb.isUserInteractionEnabled = true
        let phoneTap = UITapGestureRecognizer(target: self, action: #selector(tapPhone))
        lb.addGestureRecognizer((phoneTap))
        return lb
    }()
    
    private lazy var phoneImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "phone")
        return iv
    }()
    
    private lazy var open2GisButton: UIButton = {
        let button = UIButton()
        button.setImage(.init(named: "PaperPlaneTilt"), for: .normal)
        button.addTarget(self, action: #selector(open2GisTapped), for: .touchUpInside)
        button.tintColor = .white
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollection()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupCollection() {
        setupViews()
        setupConstrains()
    }
    private func setupViews() {
        addSubview(locationImage)
        locationImage.addSubview(openingTimeLabel)
        locationImage.addSubview(closingTimeLabel)
        locationImage.addSubview(locationNameLabel)
        locationImage.addSubview(adressLabel)
        locationImage.addSubview(adressImage)
        locationImage.addSubview(phoneLabel)
        locationImage.addSubview(phoneImage)
        locationImage.addSubview(open2GisButton)
    }
    private func setupConstrains() {
        locationImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(computedHeight(16))
            $0.trailing.equalToSuperview().offset(computedHeight(-16))
            $0.leading.equalToSuperview().offset(computedWidth(16))
            $0.bottom.equalToSuperview().offset(computedHeight(10))
        }
        openingTimeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(computedHeight(16))
            $0.leading.equalToSuperview().offset(computedWidth(16))
            $0.height.equalTo(computedHeight(14))
        }
        closingTimeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(computedHeight(14))
            make.leading.equalTo(openingTimeLabel.snp.trailing).offset(computedWidth(4))
        }
        locationNameLabel.snp.makeConstraints {
            $0.top.equalTo(openingTimeLabel.snp.bottom).offset(computedHeight(56))
            $0.leading.equalToSuperview().offset(computedWidth(16))
            $0.height.equalTo(computedHeight(34))
        }
        adressLabel.snp.makeConstraints {
            $0.leading.equalTo(adressImage.snp.trailing).offset(computedHeight(6))
            $0.bottom.equalToSuperview().offset(-16)
            $0.height.equalTo(computedHeight(14))
        }
        adressImage.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(computedHeight(8))
            $0.bottom.equalToSuperview().offset(computedHeight(-14))
            $0.height.width.equalTo(computedHeight(computedWidth(14)))
        }
        phoneLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(computedWidth(-16))
            $0.bottom.equalToSuperview().offset(computedHeight(-14))
            $0.height.equalTo(computedHeight(14))
        }
        phoneImage.snp.makeConstraints {
            $0.trailing.equalTo(phoneLabel.snp.leading).offset(computedWidth(-6))
            $0.bottom.equalToSuperview().offset(computedHeight(-14))
            $0.height.width.equalTo(computedHeight(computedWidth(12)))
        }
        open2GisButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(computedHeight(18))
            $0.trailing.equalToSuperview().offset(computedWidth(-20))
            $0.height.width.equalTo(computedHeight(computedWidth(26)))
        }
    }
    func configure(with model: BranchDTO) {
        locationNameLabel.text = model.name
        adressLabel.text = model.adress
        openingTimeLabel.text = model.openingTime?.toDate()?.toFormat("HH:mm")
        closingTimeLabel.text = model.closingTime?.toDate()?.toFormat("HH:mm")
        self.locationImage.kf.setImage(with: model.imageURL?.getURL())
    }
}


// MARK: - Selectors

extension LocationsCell {
    @objc func open2GisTapped() {
        delegate?.didTapAppButton()
    }
    
    @objc func tapPhone() {
        delegate?.didTapPhoneNumBerButton()
    }
}
    
