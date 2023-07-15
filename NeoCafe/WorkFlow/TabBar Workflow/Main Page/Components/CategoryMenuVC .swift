//
//  HorizontalMenuVC.swift
//  NeoCafe
//
//  Created by Adinay on 6/7/23.
//

import UIKit
import SnapKit

class CategoryMenuVC: BaseViewController {
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
        label.textColor = UIColor(red: 0.157, green: 0.224, blue: 0.322, alpha: 1)
        label.text = "Меню"
        return label
    }()
    private lazy var pushButton: UIButton = {
        let button = UIButton()
        button.setImage(.init(named: "push"), for: .normal)
        button.addTarget(self, action: #selector(pushTap), for: .touchUpInside)
        button.isUserInteractionEnabled = true
        return button
    }()
    private let horizontalMenuCollectionView = HorizontalMenuCollectionView()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 28, weight: .semibold)
        label.textAlignment = .left
        label.textColor = UIColor(red: 0.157, green: 0.224, blue: 0.322, alpha: 1)
        label.text = "Кофе"
        return label
    }()
    private lazy var mainTableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .white
        tv.delegate = self
        tv.dataSource = self
        tv.register(CategoryMenuTableViewCell.self, forCellReuseIdentifier: CategoryMenuTableViewCell.identifier)
        tv.rowHeight = UITableView.automaticDimension
        return tv
    }()
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = .white
        view.addSubview(backButton)
        view.addSubview(titleLabel)
        view.addSubview(pushButton)
        view.addSubview(nameLabel)
        view.addSubview(horizontalMenuCollectionView)
        view.addSubview(mainTableView)
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
        horizontalMenuCollectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(computedHeight(62))
            make.leading.trailing.equalToSuperview().inset(computedWidth(16))
            make.height.equalTo(computedHeight(40))
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(horizontalMenuCollectionView.snp.bottom).offset(computedHeight(24))
            make.leading.equalToSuperview().inset(computedWidth(16))
            make.height.equalTo(computedHeight(28))
        }
        mainTableView.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(computedHeight(16))
            make.leading.trailing.equalToSuperview().inset(computedWidth(0))
            make.bottom.equalToSuperview().offset(computedHeight(0))
        }
    }
}


// MARK: - UITableViewDataSource

extension CategoryMenuVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryMenuTableViewCell.identifier, for: indexPath) as! CategoryMenuTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}

// MARK: - UITableViewDelegate

extension CategoryMenuVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailsDishVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}


// MARK: - Selector

extension CategoryMenuVC {
    @objc private func backTap() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func pushTap() {
        
    }
}
