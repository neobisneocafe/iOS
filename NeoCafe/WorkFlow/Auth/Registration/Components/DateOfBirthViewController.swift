//
//  DateOfBirthViewController.swift
//  NeoCafe
//
//  Created by Adinay on 6/6/23.
//

import UIKit
import SnapKit

class DateOfBirthViewController: BaseViewController {
    
    var code: String? = nil
    
    private lazy var backImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "back")
        iv.isUserInteractionEnabled = true
        let imageTap = UITapGestureRecognizer(target: self, action: #selector(tapBack))
        iv.addGestureRecognizer((imageTap))
        return iv
    }()
    
    private lazy var skipLabel: UILabel = {
        let label = BaseLabel()
        label.mainSetup("Пропустить")
        label.textColor = UIColor(red: 1, green: 0.545, blue: 0.358, alpha: 1)
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.isUserInteractionEnabled = true
        let tappedForget = UITapGestureRecognizer(target: self, action: #selector(skipTapped))
        label.addGestureRecognizer(tappedForget)
        return label
    }()
    
    private lazy var mainImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "кофейня neocafe")
        return iv
    }()
    
    private lazy var registerLabel: UILabel = {
        let label = BasicMainLabel()
        label.mainSetup("Регистрация")
        return label
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = "Введите дату рождения для последующих персональных скидок"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .left
        label.textColor = UIColor(red: 0.157, green: 0.224, blue: 0.322, alpha: 1)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var birthDateField: UITextField = {
        let tf = BasicTextField()
        tf.mainSetup("01.01.1991")
        tf.setLeftPaddingPoints(56)
        if #available(iOS 13.4, *) {
            tf.addInputDatePicker(target: self, selector: #selector(doneButton))
        } else {
            // Fallback on earlier versions
        }
        return tf
    }()
    
    private lazy var getCodeButton: UIButton = {
        let button = BasicButton()
        button.mainSetup("Войти")
        button.addTarget(self, action: #selector(mainTapped), for: .touchUpInside)
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = UIColor(red: 0.973, green: 0.973, blue: 0.973, alpha: 1)
        view.addSubview(backImage)
        view.addSubview(skipLabel)
        view.addSubview(mainImage)
        view.addSubview(registerLabel)
        view.addSubview(textLabel)
        view.addSubview(birthDateField)
        view.addSubview(getCodeButton)
    }
    
    override func setupConstrains() {
        super.setupConstrains()
        backImage.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(computedHeight(40))
            $0.leading.equalToSuperview().offset(computedWidth(24))
            $0.height.equalTo(computedHeight(18))
        }
        skipLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(computedHeight(40))
            $0.trailing.equalToSuperview().offset(computedWidth(-14))
            $0.height.equalTo(computedHeight(18))
        }
        mainImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(computedHeight(106))
            $0.leading.trailing.equalToSuperview().inset(computedWidth(102))
            $0.height.equalTo(computedHeight(92))
        }
        registerLabel.snp.makeConstraints {
            $0.top.equalTo(mainImage.snp.bottom).offset(computedHeight(48))
            $0.leading.equalToSuperview().offset(computedWidth(16))
        }
        textLabel.snp.makeConstraints {
            $0.top.equalTo(registerLabel.snp.bottom).offset(computedHeight(32))
            $0.leading.equalToSuperview().offset(computedWidth(16))
            $0.trailing.equalToSuperview().inset(computedWidth(16))
            $0.height.equalTo(computedHeight(34))
        }
        birthDateField.snp.makeConstraints {
            $0.top.equalTo(textLabel.snp.bottom).offset(computedHeight(16))
            $0.leading.trailing.equalToSuperview().inset(computedWidth(16))
        }
        getCodeButton.snp.makeConstraints {
            $0.top.equalTo(birthDateField.snp.bottom).offset(computedHeight(20))
            $0.leading.trailing.equalToSuperview().inset(computedWidth(16))
        }
    }
}


// MARK: - Selector

extension DateOfBirthViewController {
    @objc func tapBack() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func mainTapped() {
        DispatchQueue.main.async { [weak self] in
            let vc = MainTabBarController()
            self?.navigationController?.pushViewController(vc, animated: true)
            print("asd")
        }
    }
    
    
    @objc  private func doneButton() {
        if let datePicker = birthDateField.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            birthDateField.text = dateFormatter.string(from: datePicker.date)
        }
        birthDateField.resignFirstResponder()
    }
    
    @objc func skipTapped() {
        let vc = MainTabBarController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
