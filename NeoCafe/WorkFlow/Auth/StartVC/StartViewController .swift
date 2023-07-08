//
//  StartViewController .swift
//  NeoCafe
//
//  Created by Adinay on 3/6/23.
//

import UIKit
import SnapKit

class StartViewController: BaseViewController {
    private lazy var mainImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "кофейня neocafe")
        return iv
    }()
    
    private lazy var toComeInButton: UIButton = {
        let button = BasicButton()
        button.mainSetup("Bойти")
        button.addTarget(self, action: #selector(toComeInButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var registrationButton: UIButton = {
        let button = BasicButton()
        button.mainSetup("Регистрация")
        button.setTitleColor(UIColor(red: 0.092, green: 0.092, blue: 0.092, alpha: 1), for: .normal)
        button.backgroundColor = UIColor(red: 0.931, green: 0.931, blue: 0.931, alpha: 1)
        button.addTarget(self, action: #selector(registrationButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = UIColor(red: 0.973, green: 0.973, blue: 0.973, alpha: 1)
        view.addSubview(mainImage)
        view.addSubview(toComeInButton)
        view.addSubview(registrationButton)
    }
    
    override func setupConstrains() {
        super.setupConstrains()
        mainImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(computedHeight(106))
            $0.leading.trailing.equalToSuperview().inset(computedWidth(102))
            $0.height.equalTo(computedHeight(92))
        }
        toComeInButton.snp.makeConstraints {
            $0.top.equalTo(mainImage.snp.bottom).offset(computedHeight(48))
            $0.leading.trailing.equalToSuperview().inset(computedWidth(16))
        }
        registrationButton.snp.makeConstraints {
            $0.top.equalTo(toComeInButton.snp.bottom).offset(computedHeight(16))
            $0.leading.trailing.equalToSuperview().inset(computedWidth(16))
        }
    }
}

// MARK: - Selector

extension StartViewController {
    @objc func toComeInButtonTapped() {
        DispatchQueue.main.async { [weak self] in
            let vc = AuthViewController()
            self?.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func registrationButtonTapped() {
        DispatchQueue.main.async { [weak self] in
            let vc = PhoneRegistrationViewController()
            self?.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
