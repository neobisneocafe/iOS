//
//  AuthViewController.swift
//  NeoCafe
//
//  Created by Adinay on 5/6/23.
//

import UIKit
import SnapKit

class AuthViewController: BaseViewController {
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
    
    private lazy var entranceLabel: UILabel = {
        let lb = BasicMainLabel()
        lb.mainSetup("Вход")
        return lb
    }()
    
    private lazy var mainStackView: UIStackView = {
        let sv = UIStackView()
        sv.spacing = 20
        sv.axis = .vertical
        sv.distribution = .fillEqually
        return sv
    }()
    
    private lazy var numberTextField: UITextField = {
        let tf = BasicTextField()
        tf.mainSetup("552 555 555")
        tf.keyboardType = .numberPad
        tf.setLeftPaddingPoints(140)
        tf.delegate = self
        return tf
    }()
    
    private lazy var numberIconImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "number")
        return iv
    }()
    
    private lazy var toGetTheCodeButton: UIButton = {
        let bt = BasicButton()
        bt.mainSetup("Получить код")
        bt.addTarget(self, action: #selector(toGetTheCodeButtonTapped), for: .touchUpInside)
        bt.alpha = numberTextField.text?.isEmpty ?? false ? 0.5 : 1.0
       
        return bt
    }()
   
//    private var countryCode = "+996"
    
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = UIColor(red: 0.973, green: 0.973, blue: 0.973, alpha: 1)
        view.addSubview(backImage)
        view.addSubview(mainImage)
        view.addSubview(entranceLabel)
        view.addSubview(mainStackView)
        view.addSubview(numberTextField)
        view.addSubview(numberIconImage)
        view.addSubview(toGetTheCodeButton)
        [numberTextField,
         toGetTheCodeButton]
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
        entranceLabel.snp.makeConstraints {
            $0.top.equalTo(mainImage.snp.bottom).offset(computedHeight(48))
            $0.leading.trailing.equalToSuperview().inset(computedWidth(16))
        }
        mainStackView.snp.makeConstraints {
            $0.top.equalTo(entranceLabel.snp.bottom).offset(computedHeight(32))
            $0.leading.trailing.equalToSuperview().inset(computedWidth(16))
        }
        numberIconImage.snp.makeConstraints {
            $0.centerY.equalTo(numberTextField.snp.centerY)
            $0.leading.equalTo(numberTextField.snp.leading).offset(computedHeight(78))
            $0.height.equalTo(computedHeight(18))
        }
    }
}


// MARK: - Selector

extension AuthViewController {
    @objc func backTap() {
        DispatchQueue.main.async { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
    }
    
    @objc func toGetTheCodeButtonTapped() {
        DispatchQueue.main.async { [weak self] in
            let vc = AuthVerificationController()
            self?.navigationController?.pushViewController(vc, animated: true)
        }
    }
}


// MARK: - UITextFieldDelegate

extension AuthViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text?.isEmpty ?? true {
            textField.text = "+996"
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let phone = numberTextField.text  else {
            return false
        }
        toGetTheCodeButton.isEnabled = !phone.isEmpty
        toGetTheCodeButton.alpha = phone.isEmpty ? 0.5 : 1.0
        return true
    }
}


