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
    
    private lazy var firstNameField: UITextField = {
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
    
    private lazy var phoneNumberTextField: UITextField = {
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
        button.alpha = firstNameField.text?.isEmpty ?? false || phoneNumberTextField.text?.isEmpty ?? false ? 0.5 : 1.0
        return button
    }()
    
    
    let signUpViewModel: SignUpViewModel
    init(signUpViewModel: SignUpViewModel) {
        self.signUpViewModel = signUpViewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private var countryCode = "+996"
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = UIColor(red: 0.973, green: 0.973, blue: 0.973, alpha: 1)
        view.addSubview(backImage)
        view.addSubview(mainImage)
        view.addSubview(registrationLabel)
        view.addSubview(mainStackView)
        view.addSubview(firstNameField)
        view.addSubview(userIconImage)
        view.addSubview(phoneNumberTextField)
        view.addSubview(numberIconImage)
        [firstNameField,
         phoneNumberTextField,
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
            $0.centerY.equalTo(firstNameField.snp.centerY).offset(computedWidth(1))
            $0.leading.equalTo(firstNameField.snp.leading).offset(computedHeight(20))
            $0.height.equalTo(computedHeight(24))
        }
        
        numberIconImage.snp.makeConstraints {
            $0.centerY.equalTo(phoneNumberTextField.snp.centerY).offset(computedWidth(1))
            $0.leading.equalTo(phoneNumberTextField.snp.leading).offset(computedHeight(20))
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
        guard let firstName = firstNameField.text,
              let phoneNumber = phoneNumberTextField.text  else { return }
        
        if !firstName.isEmpty && !phoneNumber.isEmpty {
            signUpViewModel.signUpUser(firstName: firstName, phoneNumber: phoneNumber) { [weak self] in
                DispatchQueue.main.async {
                    self?.navigationController?.pushViewController(RegisterVerificationController(registerVerificationViewModel: RegisterVerificationViewModel()), animated: true)
                }
            }
        }
    }
}


// MARK: - UITextFieldDelegate

extension PhoneRegistrationViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text?.isEmpty ?? true {
            textField.text = "996"
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let name = firstNameField.text, let phone = phoneNumberTextField.text else {
            return false
        }
        toComeInButton.isEnabled = !name.isEmpty && !phone.isEmpty
        toComeInButton.alpha = name.isEmpty || phone.isEmpty ? 0.5 : 1.0
        return true
    }
}
