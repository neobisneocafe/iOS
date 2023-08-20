//
//  ElementsView.swift
//  NeoCafe
//
//  Created by Adinay on 28/6/23.
//

import UIKit
import SnapKit

protocol ElementsViewDelegate: AnyObject {
    func didBackButton()
    func didPushTap()
    func addTapHistory()
}

class ElementsView: UIView {

    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(.init(named: "back"), for: .highlighted)
        button.addTarget(self, action: #selector(backTap), for: .touchUpInside)
        return button
    }()
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textAlignment = .center
        label.textColor = UIColor(red: 0.157, green: 0.224, blue: 0.322, alpha: 1)
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
        label.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        label.textAlignment = .center
        label.textColor = UIColor(red: 0.157, green: 0.224, blue: 0.322, alpha: 1)
        label.text = "Корзина"
        return label
    }()
    private lazy var historyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textAlignment = .right
        label.textColor = UIColor(named: "FF8B5B")
        let addTapLabel = UITapGestureRecognizer(target: self, action: #selector(addTapHistory))
        label.text = "История"
        return label
    }()

//    var viewTapped: (() -> Void)?

     init() {
        super.init(frame: .zero)
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
        addSubview(backButton)
        addSubview(titleLabel)
        addSubview(pushButton)
        addSubview(basketLabel)
        addSubview(historyLabel)
    }

    private func setupConstrains() {
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(computedHeight(50))
            $0.leading.equalToSuperview().offset(computedWidth(24))
        }
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(computedHeight(40))
            $0.leading.equalTo(backButton.snp.leading).offset(132)
            $0.height.equalTo(computedHeight(40))
        }
        pushButton.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(computedHeight(50))
            make.trailing.equalToSuperview().inset(computedWidth(16))
        }
        basketLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(computedHeight(62))
            make.leading.equalToSuperview().offset(computedWidth(16))
            make.height.equalTo(computedHeight(34))
        }
        historyLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(computedHeight(76))
            make.trailing.equalToSuperview().inset(computedWidth(-16))
        }
    }
}



// MARK: - Selector

extension ElementsView {
    @objc func backTap(){
    }
    @objc func pushTap(){
    }
    @objc func addTapHistory(){
    }
}
