//
//  HistoryOfOrdersVC.swift
//  NeoCafe
//
//  Created by Adinay on 2/7/23.
//

import UIKit
import SnapKit

class HistoryOfOrdersVC: BaseViewController {
    
    enum SectionType: String {
        case openOrder = "Открытый заказ"
        case ongoing = "Завершенные"
    }
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(.init(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(backTap), for: .touchUpInside)
        button.isUserInteractionEnabled = true
        return button
    }()
    
    private lazy var historyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textAlignment = .center
        label.textColor = UIColor(named: "blue")
        label.text = "История заказов"
        return label
    }()
    
    private lazy var mainTableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .white
        tv.delegate = self
        tv.dataSource = self
        tv.register(HistoryOfOrdersTableViewCell.self, forCellReuseIdentifier: HistoryOfOrdersTableViewCell.identifier)
        tv.rowHeight = UITableView.automaticDimension
        return tv
    }()
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = .white
        view.addSubview(backButton)
        view.addSubview(historyLabel)
        view.addSubview(mainTableView)
    }
    
    override func setupConstrains() {
        super.setupConstrains()
        backButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(computedHeight(16))
            $0.leading.equalToSuperview().offset(computedWidth(24))
        }
        historyLabel.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(computedHeight(14))
            $0.leading.equalTo(backButton.snp.trailing).offset(computedWidth(80))
            $0.height.equalTo(computedHeight(18))
        }
        mainTableView.snp.makeConstraints {
            $0.top.equalTo(historyLabel.snp.bottom).offset(computedHeight(14))
            $0.leading.trailing.equalToSuperview().inset(computedWidth(0))
            $0.bottom.equalToSuperview().offset(computedHeight(-20))
        }
    }
}



// MARK: - UITableViewDataSource, UITableViewDelegate

extension HistoryOfOrdersVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryOfOrdersTableViewCell.identifier, for: indexPath) as! HistoryOfOrdersTableViewCell
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // Возвращаем количество секций
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // Возвращаем заголовок для каждой секции
        if section == 0 {
            return SectionType.openOrder.rawValue
        } else {
            return SectionType.ongoing.rawValue
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let vc = OpenOrderVC()
            navigationController?.pushViewController(vc, animated: true)
        } else {
            let vc = CompletedOrderVC()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 116
}



// MARK: - Selector

extension HistoryOfOrdersVC {
    @objc func backTap() {
        navigationController?.popViewController(animated: true)
    }
}
