//
//  BasketViewController.swift
//  NeoCafe
//
//  Created by Adinay on 8/6/23.
//

import UIKit
import SnapKit

class BasketViewController: BaseViewController {
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(.init(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(backTap), for: .touchUpInside)
        button.isUserInteractionEnabled = true
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textAlignment = .center
        label.textColor = UIColor(named: "blue")
        label.text = "Корзина"
        return label
    }()
    
    private lazy var pushButton: UIButton = {
        let button = UIButton()
        button.setImage(.init(named: "push"), for: .normal)
        button.addTarget(self, action: #selector(pushTap), for: .touchUpInside)
        button.isUserInteractionEnabled = true
        return button
    }()
    
    private lazy var basketLabel: UILabel = {
        let label = UILabel()
        label.text = "Корзина"
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.textAlignment = .center
        label.textColor = UIColor(named: "blue")
        return label
    }()
    
    private lazy var historyLabel: UILabel = {
        let label = UILabel()
        label.text = "История"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .right
        label.textColor = UIColor(named: "FF8B5B")
        let addTapLabel = UITapGestureRecognizer(target: self, action: #selector(addTapHistory))
        label.addGestureRecognizer(addTapLabel)
        label.isUserInteractionEnabled = true
        return label
    }()
    
    private lazy var animalImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "animal")
        return iv
    }()
    
    private let deckLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        label.textColor = UIColor(named: "blue")
        label.text = "Вы еще ничего не выбрали"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    private lazy var menuButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .orange
        button.addCornerRadius(10)
        button.setTitle("В меню", for: .normal)
        button.addTarget(self, action: #selector(menuTap), for: .touchUpInside)
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = .white
        view.addSubview(backButton)
        view.addSubview(titleLabel)
        view.addSubview(pushButton)
        view.addSubview(basketLabel)
        view.addSubview(historyLabel)
        view.addSubview(animalImage)
        view.addSubview(deckLabel)
        view.addSubview(menuButton)
    }
    
    override func setupConstrains() {
        super.setupConstrains()
        backButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(computedHeight(16))
            $0.leading.equalToSuperview().offset(computedWidth(24))
        }
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(computedHeight(16))
            $0.leading.equalTo(backButton.snp.leading).offset(computedWidth(132))
            $0.height.equalTo(computedHeight(18))
        }
        pushButton.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(computedHeight(16))
            $0.trailing.equalToSuperview().inset(computedWidth(16))
        }
        basketLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(computedHeight(66))
            $0.leading.equalToSuperview().offset(computedWidth(16))
            $0.height.equalTo(computedHeight(34))
        }
        historyLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(computedHeight(76))
            make.trailing.equalToSuperview().inset(computedWidth(16))
        }
        animalImage.snp.makeConstraints { make in
            make.top.equalTo(basketLabel.snp.bottom).offset(computedHeight(20))
            make.trailing.leading.equalToSuperview().inset(computedWidth(16))
        }
        deckLabel.snp.makeConstraints { make in
            make.top.equalTo(animalImage.snp.bottom).offset(computedHeight(32))
            make.trailing.equalToSuperview().inset(computedWidth(40))
        }
        menuButton.snp.makeConstraints { make in
            make.top.equalTo(deckLabel.snp.bottom).offset(computedHeight(40))
            make.trailing.leading.equalToSuperview().inset(computedWidth(16))
            make.height.equalTo(computedHeight(56))
        }
    }
}


// MARK: - Selector

extension BasketViewController {
    @objc func backTap() {
    }
    
    @objc func pushTap() {
    }
    
    @objc func addTapHistory() {
        let vc = HistoryOfOrdersVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func menuTap () {
        let vc = AddToCartVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}
