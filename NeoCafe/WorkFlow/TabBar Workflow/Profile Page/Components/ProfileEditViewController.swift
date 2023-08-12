//
//  ProfileEditViewController.swift
//  NeoCafe
//
//  Created by Adinay on 20/6/23.
//

import UIKit
import SnapKit

class ProfileEditViewController: BaseViewController {
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(.init(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(backTap), for: .touchUpInside)
        button.isUserInteractionEnabled = true
        return button
    }()
    
    private lazy var editleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textAlignment = .center
        label.textColor = UIColor(named: "blue")
        label.text = "Редактирование профиля"
        return label
    }()
    
    private lazy var editProfileleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.textAlignment = .left
        label.textColor = UIColor(named: "blue")
        label.text = "Редактирование"
        return label
    }()
    
    private lazy var logOutButton: UIButton = {
        let button = UIButton()
        button.setImage(.init(named: "signOut"), for: .normal)
        button.addTarget(self, action: #selector(tapLogOut), for: .touchUpInside)
        button.isUserInteractionEnabled = true
        return button
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
        tf.mainTextField("Себастьян")
        tf.setLeftPaddingPoints(72)
        return tf
    }()
    
    private lazy var nameImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "user")
        return iv
    }()
    
    private lazy var phoneTextField: UITextField = {
        let tf = BasicTextField()
        tf.mainTextField("552 321 123")
        tf.delegate = self
        tf.keyboardType = .numberPad
        tf.setLeftPaddingPoints(72)
        return tf
    }()
    
    private lazy var phoneImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "number")
        return iv
    }()
    
    private lazy var birthTextField: UITextField = {
        let tf = BasicTextField()
        tf.mainTextField("01.01.1991")
        tf.setLeftPaddingPoints(72)
        if #available(iOS 13.4, *) {
            tf.addInputDatePicker(target: self, selector: #selector(doneButton))
        } else {
            // Fallback on earlier versions
        }
        return tf
    }()
    
    private lazy var calendarImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "calendar")
        return iv
    }()
    
    private lazy var saveButton: UIButton = {
        let button = BasicButton()
        button.mainSetup("Сохранить")
        button.addCornerRadius(10)
        button.addTarget(self, action: #selector(saveTap), for: .touchUpInside)
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = .white
        view.addSubview(backButton)
        view.addSubview(editleLabel)
        view.addSubview(editProfileleLabel)
        view.addSubview(logOutButton)
        view.addSubview(mainStackView)
        view.addSubview(nameTextField)
        view.addSubview(nameImage)
        view.addSubview(phoneTextField)
        view.addSubview(phoneImage)
        view.addSubview(birthTextField)
        view.addSubview(calendarImage)
        [nameTextField,
         phoneTextField,
         birthTextField,
         saveButton]
        .forEach {mainStackView.addArrangedSubview($0)}
    }
    
    override func setupConstrains() {
        super.setupConstrains()
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(computedHeight(50))
            $0.leading.equalToSuperview().offset(computedWidth(24))
        }
        editleLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(computedHeight(38))
            make.leading.equalTo(backButton.snp.leading).offset(computedWidth(58))
            make.height.equalTo(computedHeight(40))
        }
        editProfileleLabel.snp.makeConstraints { make in
            make.top.equalTo(editleLabel.snp.bottom).offset(computedHeight(26))
            make.leading.equalTo(computedWidth(16))
        }
        logOutButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(computedHeight(12))
            $0.trailing.equalToSuperview().offset(computedWidth(-16))
        }
        mainStackView.snp.makeConstraints {
            $0.top.equalTo(editProfileleLabel.snp.bottom).offset(computedHeight(34))
            $0.leading.trailing.equalToSuperview().inset(computedWidth(16))
        }
        nameImage.snp.makeConstraints {
            $0.centerY.equalTo(nameTextField.snp.centerY)
            $0.leading.equalTo(nameTextField.snp.leading).offset(computedWidth(30))
            $0.height.equalTo(computedHeight(18))
        }
        phoneImage.snp.makeConstraints { make in
            make.centerY.equalTo(phoneTextField.snp.centerY)
            make.leading.equalTo(phoneTextField.snp.leading).offset(computedWidth(36))
        }
        calendarImage.snp.makeConstraints {
            $0.centerY.equalTo(birthTextField.snp.centerY)
            $0.leading.equalTo(birthTextField.snp.leading).offset(computedWidth(36))
            $0.height.equalTo(computedHeight(18))
        }
    }
}


// MARK: - Selector

extension ProfileEditViewController {
    @objc func backTap() {
        navigationController?.popViewController(animated: true)
       print("назад")
    }
    
    @objc func tapLogOut() {
        signOutProfileAlert()
        print("Выход из Системы Приложение)))")
    }
    
    @objc func saveTap() {
        editProfileAlert()
        print("сохранить")
    }
    
    @objc func doneButton() {
        if let datePicker = birthTextField.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
//            dateFormatter.locale = Locale(identifier: "en_US_POSIX")

            //            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            //            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
            birthTextField.text = dateFormatter.string(from: datePicker.date)
            //            bDayDate = datePicker.date
        }
        birthTextField.resignFirstResponder()
    }
    }


// MARK: - UITextFieldDelegate

extension ProfileEditViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text?.isEmpty ?? true {
            textField.text = "+996"
        }
    }
}
