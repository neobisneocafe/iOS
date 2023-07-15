//
//  CompletedOrderVC.swift
//  NeoCafe
//
//  Created by Adinay on 1/7/23.
//

import UIKit
import SnapKit

class CompletedOrderVC: BaseViewController {
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(.init(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(backTap), for: .touchUpInside)
        button.isUserInteractionEnabled = true
        return button
    }()
    
    private lazy var orderLabel: UILabel = {
        let label = UILabel()
        label.text = "Заказ №2324"
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textAlignment = .center
        label.textColor = UIColor(red: 0.157, green: 0.224, blue: 0.322, alpha: 1)
        return label
    }()
    
    private lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.text = "NeoCafe Dzerzhinka, 4 октября"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.numberOfLines = 0
        label.textColor = UIColor(named: "blue")
        return label
    }()
    
    private lazy var mainTableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .white
        tv.delegate = self
        tv.dataSource = self
        tv.register(CompletedOrderTableViewCell.self, forCellReuseIdentifier: CompletedOrderTableViewCell.identifier)
        tv.rowHeight = UITableView.automaticDimension
        return tv
    }()
    
//    private lazy var  scrollView: UIScrollView = {
//        let sv = UIScrollView()
//        return sv
//    }()
//
//    private lazy var contentView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .red
//        return view
//    }()
    
    private lazy var bonusesLabel: UILabel = {
        let label = UILabel()
        label.text = "Бонусы к списанию:"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .left
        label.textColor = UIColor(named: "blue")
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "50 c"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = UIColor(named: "FF8B5B")
        return label
    }()
    
    private lazy var sumLabel: UILabel = {
        let label = UILabel()
        label.text = "Итого:"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .left
        label.textColor = UIColor(named: "blue")
        return label
    }()
    
    private lazy var totalSumLabel: UILabel = {
        let label = UILabel()
        label.text = "450 c"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = UIColor(named: "FF8B5B")
        return label
    }()
    
    private lazy var repeatButton: UIButton = {
        let button = BasicButton()
        button.mainSetup("Закрыть счет")
        button.addCornerRadius(10)
        button.backgroundColor = UIColor(red: 0.157, green: 0.224, blue: 0.322, alpha: 1)
        button.addTarget(self, action: #selector(repeatTap), for: .touchUpInside)
        return button
    }()
    
//    let effect = UIBlurEffect(style: .dark)
//            let effectView = UIVisualEffectView(effect: effect)
//    func effectView;.frame = view.bounds
//            effectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

    
    private var bonusTextField = UITextField()
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = .white
        view.addSubview(backButton)
        view.addSubview(orderLabel)
        view.addSubview(numberLabel)
        view.addSubview(mainTableView)
        view.addSubview(bonusesLabel)
        view.addSubview(priceLabel)
        view.addSubview(sumLabel)
        view.addSubview(totalSumLabel)
        view.addSubview(repeatButton)
    }
    
    override func setupConstrains() {
        super.setupConstrains()
        backButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(computedHeight(16))
            $0.leading.equalToSuperview().offset(computedWidth(24))
        }
        orderLabel.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(computedHeight(18))
            $0.leading.equalTo(backButton.snp.leading).offset(computedWidth(104))
            $0.height.equalTo(computedHeight(18))
        }
        numberLabel.snp.makeConstraints{
            $0.top.equalTo(orderLabel.snp.bottom).offset(computedHeight(20))
            $0.leading.trailing.equalToSuperview().inset(computedWidth(16))
        }
        mainTableView.snp.makeConstraints { make in
            make.top.equalTo(numberLabel.snp.bottom).offset(computedHeight(12))
            make.leading.trailing.equalToSuperview().inset(computedWidth(0))
            make.bottom.equalToSuperview().offset(computedHeight(-220))
        }
//        scrollView.snp.makeConstraints {
//            $0.top.equalTo(mainTableView.snp.bottom).offset(computedHeight(6))
//            $0.leading.trailing.equalToSuperview().inset(computedWidth(16))
//            $0.bottom.equalToSuperview().offset(-30)
//        }
//
//        contentView.snp.makeConstraints {
//            $0.top.leading.trailing.equalToSuperview()
//            $0.centerX.equalToSuperview()
//            $0.bottom.equalToSuperview().offset(14)
//        }

        bonusesLabel.snp.makeConstraints {
            $0.top.equalTo(mainTableView.snp.bottom).offset(computedHeight(14))
            $0.leading.equalToSuperview().offset(computedWidth(16))
            $0.height.equalTo(computedHeight(16))
        }
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(mainTableView.snp.bottom).offset(computedHeight(10))
            $0.leading.equalTo(bonusesLabel.snp.trailing).offset(computedWidth(8))
            $0.height.equalTo(computedHeight(22))
        }
        sumLabel.snp.makeConstraints {
            $0.top.equalTo(bonusesLabel.snp.bottom).offset(computedHeight(20))
            $0.leading.equalToSuperview().offset(computedWidth(16))
        }
        totalSumLabel.snp.makeConstraints {
            $0.top.equalTo(bonusesLabel.snp.bottom).offset(computedHeight(14))
            $0.leading.equalTo(sumLabel.snp.trailing).offset(computedWidth(8))
            $0.height.equalTo(computedHeight(22))
        }
        repeatButton.snp.makeConstraints { make in
            make.top.equalTo(totalSumLabel.snp.bottom).offset(computedHeight(18))
            make.leading.trailing.equalToSuperview().inset(computedWidth(16))
            make.height.equalTo(computedHeight(40))
        }
    }
}


// MARK: - UITableViewDataSource, UITableViewDelegate

extension CompletedOrderVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CompletedOrderTableViewCell.identifier, for: indexPath) as! CompletedOrderTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 118
    }
    
}

// MARK: - Selector

extension CompletedOrderVC {
    @objc func  backTap() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func repeatTap() {
        showWriteOffOfBonusesAlert()
        print("tapAlert")
    }
    
    private func showWriteOffOfBonusesAlert() {
          let alertController = UIAlertController(
            title: "Списание бонусов",
            message: "У вас есть 100 бонусов, хотите использовать их?",
            preferredStyle: .alert)
          
          let yesAction = UIAlertAction(title: "Да", style: .default) { (_) in
              self.showBonusAlert()
          }
          
          let noAction = UIAlertAction(title: "Нет", style: .cancel,
                                       handler: nil)
//          alertController.view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
          alertController.addAction(yesAction)
          alertController.addAction(noAction)
          
          present(alertController, animated: true, completion: nil)
      }
    
    private func showBonusAlert() {
        let alert = UIAlertController(
            title: "Cписание бонусов",
            message: "Введите количество бонусов, которое хотите списать",
            preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: configurationTextField)
        alert.addAction(UIAlertAction(title: "Списать",
                                      style: .default) {_ in
        })
        alert.addAction(UIAlertAction(title: "Отмена",
                                      style: .cancel))
        present(alert, animated: true)
        
//        alert.view.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        alert.view.superview?.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        
    }
    
    private func configurationTextField(textField: UITextField) {
        self.bonusTextField = textField
        textField.keyboardType = .numberPad
    }
}
