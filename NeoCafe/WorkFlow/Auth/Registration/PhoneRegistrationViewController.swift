//
//  PhoneRegistrationViewController.swift
//  NeoCafe
//
//  Created by Adinay on 5/6/23.
//

import UIKit
import SnapKit

class PhoneRegistrationViewController: BaseViewController {
    private lazy var backImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "back")
        iv.isUserInteractionEnabled = true
        let imageTap = UITapGestureRecognizer(target: self, action: #selector(backTap))
        iv.addGestureRecognizer((imageTap))
        return iv
    }()
    
    private lazy var mainImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "кофейня neocafe")
        return iv
    }()
    
    private lazy var registrationLabel: UILabel = {
        let lb = BasicMainLabel()
        lb.mainSetup("Регистрация")
        return lb
    }()
    
    private lazy var mainStackView: UIStackView = {
        let sv = UIStackView()
        sv.spacing = 20
        sv.axis = .vertical
        sv.distribution = .fillEqually
        return sv
    }()
    
    private lazy var nameTextField: UITextField = {
        let tf = BasicTextField()
        tf.mainSetup("Имя")
        tf.setLeftPaddingPoints(56)
        return tf
    }()
    
    private lazy var userIconImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "user")
        return iv
    }()
    
    private lazy var numberTextField: UITextField = {
        let tf = BasicTextField()
        tf.mainSetup("555 555 555")
        tf.setLeftPaddingPoints(56)
        tf.keyboardType = .numberPad
        tf.delegate = self
        return tf
    }()
    
    private lazy var numberIconImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "number")
        return iv
    }()
    
    private lazy var toComeInButton: UIButton = {
        let button = BasicButton()
        button.mainSetup("Получить код")
        button.addTarget(self, action: #selector(toComeInTapped), for: .touchUpInside)
        button.alpha = nameTextField.text?.isEmpty ?? false || numberTextField.text?.isEmpty ?? false ? 0.5 : 1.0
        return button
    }()
    
    private var countryCode = "+996"
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = UIColor(red: 0.973, green: 0.973, blue: 0.973, alpha: 1)
        view.addSubview(backImage)
        view.addSubview(mainImage)
        view.addSubview(registrationLabel)
        view.addSubview(mainStackView)
        view.addSubview(nameTextField)
        view.addSubview(userIconImage)
        view.addSubview(numberTextField)
        view.addSubview(numberIconImage)
        [nameTextField,
         numberTextField,
         toComeInButton]
        .forEach {mainStackView.addArrangedSubview($0)}
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
        
        registrationLabel.snp.makeConstraints {
            $0.top.equalTo(mainImage.snp.bottom).offset(computedHeight(48))
            $0.leading.equalToSuperview().offset(computedWidth(16))
        }
        
        mainStackView.snp.makeConstraints {
            $0.top.equalTo(registrationLabel.snp.bottom).offset(computedHeight(32))
            $0.leading.trailing.equalToSuperview().inset(computedWidth(16))
        }
        
        userIconImage.snp.makeConstraints {
            $0.centerY.equalTo(nameTextField.snp.centerY).offset(computedWidth(1))
            $0.leading.equalTo(nameTextField.snp.leading).offset(computedHeight(20))
            $0.height.equalTo(computedHeight(24))
        }
        
        numberIconImage.snp.makeConstraints {
            $0.centerY.equalTo(numberTextField.snp.centerY).offset(computedWidth(1))
            $0.leading.equalTo(numberTextField.snp.leading).offset(computedHeight(20))
            $0.height.equalTo(computedHeight(24))
        }
    }
}



// MARK: - Selector

extension PhoneRegistrationViewController {
    @objc func backTap() {
        DispatchQueue.main.async { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
    }
    
    @objc func toComeInTapped() {
        DispatchQueue.main.async { [weak self] in
            let vc = RegisterVerificationController()
            self?.navigationController?.pushViewController(vc, animated: true)
        }
    }
}


// MARK: - UITextFieldDelegate

extension PhoneRegistrationViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text?.isEmpty ?? true {
            textField.text = "+996"
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let name = nameTextField.text, let phone = numberTextField.text else {
            return false
        }
        toComeInButton.isEnabled = !name.isEmpty && !phone.isEmpty
        toComeInButton.alpha = name.isEmpty || phone.isEmpty ? 0.5 : 1.0
        return true
    }
}
