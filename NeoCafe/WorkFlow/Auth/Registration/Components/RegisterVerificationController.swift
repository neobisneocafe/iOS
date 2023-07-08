//
//  RegisterVerificationController.swift
//  NeoCafe
//
//  Created by Adinay on 6/6/23.
//

import UIKit
import SnapKit

class RegisterVerificationController: BaseViewController {
    private lazy var backImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "back")
        iv.isUserInteractionEnabled = true
        let imageTap = UITapGestureRecognizer(target: self, action: #selector(tapBack))
        iv.addGestureRecognizer((imageTap))
        return iv
    }()
    
    private lazy var mainImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "кофейня neocafe")
        return iv
    }()
    
    private lazy var mainLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Введите 4-х значный код"
        lb.textColor = UIColor(red: 0.157, green: 0.224, blue: 0.322, alpha: 1)
        lb.font = .systemFont(ofSize: 18, weight: .regular)
        lb.numberOfLines = 0
        return lb
    }()
    
    private lazy var mainTapLabel: UILabel = {
        let lb = UILabel()
        lb.textAlignment = .center
        lb.text = "отправленный на номер 0552 321 123"
        lb.textColor = UIColor(red: 0.157, green: 0.224, blue: 0.322, alpha: 1)
        lb.font = .systemFont(ofSize: 18, weight: .regular)
        lb.numberOfLines = 0
        return lb
    }()
    
    private lazy var mainTextField: UITextField = {
        let tf = OneTimeCodeTextField()
        tf.configure()
        tf.defaultCharacter = "-"
        tf.didEnterLastDigit = { [weak self] code in
            print(code)
        }
        return tf
    }()
    
    private lazy var tocomeInnButton: UIButton = {
        let button = BasicButton()
        button.mainSetup("Войти")
        button.addTarget(self, action: #selector(toComeInButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var sendAgainLabel: UILabel = {
        let label = BaseLabel()
        label.mainSetup("Отправить еще раз")
        label.numberOfLines = 0
        label.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(sendAgainTap))
        label.addGestureRecognizer(tap)
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = UIColor(red: 0.973, green: 0.973, blue: 0.973, alpha: 1)
        view.addSubview(backImage)
        view.addSubview(mainImage)
        view.addSubview(mainLabel)
        view.addSubview(mainTapLabel)
        view.addSubview(mainTextField)
        view.addSubview(tocomeInnButton)
        view.addSubview(sendAgainLabel)
    }
    
    override func setupConstrains() {
        super.setupConstrains()
        backImage.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(computedHeight(40))
            $0.leading.equalToSuperview().offset(computedWidth(24))
            $0.height.equalTo(computedHeight(18))
        }
        
        mainImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(computedHeight(106))
            $0.leading.trailing.equalToSuperview().inset(computedWidth(102))
            $0.height.equalTo(computedHeight(92))
        }
        
        mainLabel.snp.makeConstraints {
            $0.top.equalTo(mainImage.snp.bottom).offset(computedHeight(38))
            $0.leading.trailing.equalToSuperview().inset(computedWidth(76))
        }
        
        mainTapLabel.snp.makeConstraints {
            $0.top.equalTo(mainLabel.snp.bottom).offset(computedHeight(4))
            $0.leading.equalToSuperview().offset(computedWidth(30))
        }
        
        mainTextField.snp.makeConstraints {
            $0.top.equalTo(mainTapLabel.snp.bottom).offset(computedHeight(36))
            $0.leading.trailing.equalToSuperview().inset(computedWidth(106))
            $0.height.equalTo(computedHeight(40))
            $0.width.equalTo(computedWidth(24))
        }
        
        tocomeInnButton.snp.makeConstraints {
            $0.top.equalTo(mainTextField.snp.bottom).offset(computedHeight(36))
            $0.leading.trailing.equalToSuperview().inset(computedWidth(16))
        }
        
        sendAgainLabel.snp.makeConstraints {
            $0.top.equalTo(tocomeInnButton.snp.bottom).offset(computedHeight(20))
            $0.leading.equalToSuperview().offset(computedWidth(128))
        }
    }
}


// MARK: - Selector

extension RegisterVerificationController {
    @objc func tapBack() {
        DispatchQueue.main.async { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
    }
    
    @objc func toComeInButtonTapped() {
        DispatchQueue.main.async { [weak self] in
            let vc = DateOfBirthViewController()
            self?.navigationController?.pushViewController(vc, animated: true)
            print("dsfs")
        }
    }
    
    @objc func sendAgainTap() {
      print("sds")
    }
}

