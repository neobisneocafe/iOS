//
//  HistoryOfOrdersVC.swift
//  NeoCafe
//
//  Created by Adinay on 2/7/23.
//

import UIKit
import SnapKit
import SwiftDate

class HistoryOfOrdersVC: BaseViewController {
    
    enum SectionType: String, CaseIterable {
        case openOrder = "Открытый заказ"
        case сompleted = "Завершенные"
    }
    
    // MARK: - Private Props
    
    private let viewModel = HistoryOfOrdersVM()
    private var items: [HistoryOfOrdersTableViewCell.Props] = []
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
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
    
    func fetchData() {
        viewModel.fetchHistory { [weak self] response in
            guard let self else { return }

            items = response.map {
                .init(
                    id: $0.id ?? -1,
                    isCompleted: $0.isCompleted ?? false,
                    branchImageUrl: $0.branch?.imageUrl,
                    branch: $0.branch?.name ?? "n/n",
                    products: $0.dishes?.compactMap { $0.name }.joined(separator: ", ") ?? "n/n",
                    date: $0.createdAt?.toDate()?.toFormat("dd MMMM", locale: Locales.russian) ?? "n/n"
                )
            }
            mainTableView.reloadData()
        }
    }
}



// MARK: - UITableViewDataSource, UITableViewDelegate

extension HistoryOfOrdersVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return items.filter({ $0.isCompleted == false  }).count

        case 1:
            return items.filter({ $0.isCompleted == true  }).count

        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var item: HistoryOfOrdersTableViewCell.Props?

        switch indexPath.section {
        case 0:
            item = items.filter({ $0.isCompleted == false })[indexPath.row]

        case 1:
            item = items.filter({ $0.isCompleted == true })[indexPath.row]

        default:
            return UITableViewCell()
        }

        guard let item else { return UITableViewCell() }

        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryOfOrdersTableViewCell.identifier, for: indexPath) as! HistoryOfOrdersTableViewCell
        cell.render(item)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // Возвращаем количество секций
        return SectionType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // Возвращаем заголовок для каждой секции
        SectionType.allCases[section].rawValue
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]

        if indexPath.section == 0 {
            let vc = OpenOrderVC(item.id)
            navigationController?.pushViewController(vc, animated: true)
        } else {
            let vc = CompletedOrderVC(item.id)
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
