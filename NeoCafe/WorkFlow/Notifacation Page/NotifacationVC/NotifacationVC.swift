//
//  NotifacationVC.swift
//  NeoCafe
//
//  Created by Adinay on 9/7/23.
//

import UIKit
import SnapKit

class NotifacationVC: BaseViewController {
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(.init(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(backTap), for: .touchUpInside)
        button.isUserInteractionEnabled = true
        return button
    }()
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textAlignment = .center
        label.textColor = UIColor(named: "blue")
        label.text = "Уведомления"
        return label
    }()
    private lazy var mainTableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .clear
        tv.delegate = self
        tv.dataSource = self
        tv.register(NotifacationTableViewCell.self, forCellReuseIdentifier: NotifacationTableViewCell.identifier)
        tv.rowHeight = UITableView.automaticDimension
        return tv
    }()
    
    var modelsss = [
    "Пожалуйста свайпните для того чтобы удалить сообщение",
    "Пожалуйста свайпните для того чтобы удалить сообщение",
    "Пожалуйста свайпните для того чтобы удалить сообщение",
    "Пожалуйста свайпните для того чтобы удалить сообщение",
    "Пожалуйста свайпните для того чтобы удалить сообщение",
    "Пожалуйста свайпните для того чтобы удалить сообщение"]
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 2)
        view.addSubview(backButton)
        view.addSubview(titleLabel)
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
            $0.leading.equalTo(backButton.snp.leading).offset(computedWidth(104))
            $0.height.equalTo(computedHeight(24))
        }
        mainTableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(computedHeight(32))
            make.leading.trailing.equalToSuperview().inset(computedWidth(0))
            make.bottom.equalToSuperview().offset(computedHeight(34))
        }
    }
}


// MARK: - UITableViewDataSource, UITableViewDelegate

extension NotifacationVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NotifacationTableViewCell.identifier, for: indexPath) as! NotifacationTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            mainTableView.beginUpdates()
            modelsss.remove(at: indexPath.row)
            mainTableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}


// MARK: - Selectors

extension NotifacationVC {
    @objc private func backTap() {
        navigationController?.popViewController(animated: true)
    }
}
