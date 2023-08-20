//
//  HistoryOrderViewController.swift
//  NeoCafe
//
//  Created by Adinay on 28/6/23.
//

import UIKit
import SnapKit
import FittedSheets

class AddToCartVC: BaseViewController {
    
    private let tableOrderViewModel =  TableResponseVM()
    private let branchId = -1
    
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(.init(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(backTap), for: .touchUpInside)
        button.isUserInteractionEnabled = true
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Корзина"
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textAlignment = .center
        label.textColor = UIColor(red: 0.157, green: 0.224, blue: 0.322, alpha: 1)
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
        label.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        label.textAlignment = .center
        label.textColor = UIColor(red: 0.157, green: 0.224, blue: 0.322, alpha: 1)
        return label
    }()
    
    private lazy var historyLabel: UILabel = {
        let label = UILabel()
        label.text = "История"
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textAlignment = .right
        label.textColor = UIColor(named: "FF8B5B")
        let addTapLabel = UITapGestureRecognizer(target: self, action: #selector(addTapHistory))
        label.addGestureRecognizer(addTapLabel)
        label.isUserInteractionEnabled = true
        return label
    }()
    
    private lazy var mainTableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .white
        tv.delegate = self
        tv.dataSource = self
        tv.register(AddToCartTableViewCell.self, forCellReuseIdentifier: AddToCartTableViewCell.identifier)
        tv.rowHeight = UITableView.automaticDimension
        return tv
    }()
    
    private lazy var addMoreButton: UIButton = {
        let button = UIButton()
        button.setTitle("Добавить еще", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(UIColor(red: 1, green: 0.649, blue: 0.5, alpha: 1), for: .normal)
        button.layer.borderColor = UIColor(red: 1, green: 0.649, blue: 0.5, alpha: 1).cgColor
        button.layer.borderWidth = 2
        button.addCornerRadius(10)
        button.addTarget(self, action: #selector(addMoreTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var sumLabel: UILabel = {
        let label = UILabel()
        label.text = "Итого:"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textAlignment = .left
        label.textColor = UIColor(named: "blue")
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "450 c"
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textColor = UIColor(named: "FF8B5B")
        return label
    }()
    
    private lazy var mainStackView: UIStackView = {
        let sv = UIStackView()
        sv.spacing = 20
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        return sv
    }()
    
    private lazy var takeAwayButton: UIButton = {
        let button = UIButton()
        button.addCornerRadius(30)
        button.setTitle("Возьму с собой", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(red: 0.931, green: 0.931, blue: 0.931, alpha: 1)
        button.addTarget(self, action: #selector(takeAwayTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var inTheCafeButton: UIButton = {
        let button = UIButton()
        button.addCornerRadius(30)
        button.setTitle("В заведении", for: .normal)
        button.backgroundColor = UIColor(named: "FF8B5B")
        button.addTarget(self, action: #selector(inTheCafeTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var orderButton: UIButton = {
        let button = UIButton()
        button.addCornerRadius(10)
        button.setTitle("Заказать", for: .normal)
        button.backgroundColor = UIColor(named: "FF8B5B")
        button.addTarget(self, action: #selector(orderTapped), for: .touchUpInside)
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
        view.addSubview(mainTableView)
        view.addSubview(addMoreButton)
        view.addSubview(sumLabel)
        view.addSubview(priceLabel)
        view.addSubview(mainStackView)
        view.addSubview(takeAwayButton)
        view.addSubview(inTheCafeButton)
        [takeAwayButton,
         inTheCafeButton]
        .forEach {mainStackView.addArrangedSubview($0)}
        view.addSubview(orderButton)
    }
    
    override func setupConstrains() {
        super.setupConstrains()
        backButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(computedHeight(16))
            $0.leading.equalToSuperview().offset(computedWidth(24))
        }
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(computedHeight(18))
            $0.leading.equalTo(backButton.snp.leading).offset(132)
            $0.height.equalTo(computedHeight(18))
        }
        pushButton.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(computedHeight(16))
            $0.trailing.equalToSuperview().inset(computedWidth(16))
        }
        basketLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(computedHeight(66))
            make.leading.equalToSuperview().offset(computedWidth(16))
            make.height.equalTo(computedHeight(34))
        }
        historyLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(computedHeight(76))
            make.trailing.equalToSuperview().inset(computedWidth(16))
        }
        mainTableView.snp.makeConstraints {
            $0.top.equalTo(historyLabel.snp.bottom).offset(computedHeight(4))
            $0.leading.trailing.equalToSuperview().inset(computedWidth(0))
            $0.bottom.equalToSuperview().offset(computedHeight(-308))
        }
        addMoreButton.snp.makeConstraints {
            $0.top.equalTo(mainTableView.snp.bottom).offset(computedHeight(14))
            $0.leading.trailing.equalToSuperview().inset(computedWidth(16))
            $0.height.equalTo(computedHeight(42))
        }
        sumLabel.snp.makeConstraints {
            $0.top.equalTo(addMoreButton.snp.bottom).offset(computedHeight(12))
            $0.leading.equalToSuperview().offset(computedWidth(16))
        }
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(addMoreButton.snp.bottom).offset(computedHeight(10))
            $0.leading.equalTo(sumLabel.snp.trailing).offset(computedWidth(8))
        }
        mainStackView.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom).offset(computedHeight(18))
            $0.leading.trailing.equalToSuperview().inset(computedWidth(16))
            $0.height.equalTo(computedHeight(52))
        }
        orderButton.snp.makeConstraints {
            $0.top.equalTo(mainStackView.snp.bottom).offset(computedHeight(14))
            $0.leading.trailing.equalToSuperview().inset(computedWidth(16))
            $0.height.equalTo(computedHeight(42))
        }
    }
}



// MARK: - UITableViewDataSource, UITableViewDelegate

extension AddToCartVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AddToCartTableViewCell.identifier, for: indexPath) as! AddToCartTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 112
    }
}


// MARK: - Selector

extension AddToCartVC {
    @objc func backTap() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func pushTap() {
        
    }
    
    @objc func addTapHistory() {
        let vc = HistoryOfOrdersVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func addMoreTapped() {
        
    }
    
    @objc func takeAwayTapped() {
       
    }
    
    @objc func inTheCafeTapped() {
        let qrCodeVC = UINavigationController(rootViewController: QRCodeViewController().self)
        let controllerSheet = SheetViewController(controller: qrCodeVC, sizes: [.percent(0.8)])
        controllerSheet.cornerRadius = 44
        controllerSheet.allowPullingPastMaxHeight = false
        present(controllerSheet, animated: true)
    }
    
    @objc func orderTapped() {
        tableOrderViewModel.fetchTableOrders(requst: .init(uniqueCode: "NzQtnuTgYi67kA5N7jG1", dishId: [ 1, 2], bonusPoints: 0), branchId: branchId) { response in
            debugPrint(response)
        }
    }
}
