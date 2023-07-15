//
//  DetailsDishVC.swift
//  NeoCafe
//
//  Created by Adinay on 12/7/23.
//

import UIKit
import SnapKit

protocol DetailsDishVCDelegate: AnyObject {
    func dishTap()
}

class DetailsDishVC: BaseViewController {
    weak var delegate: DetailsDishVCDelegate?
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var dishImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "dish")
        return iv
    }()
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(.init(named: "back-main"), for: .normal)
        button.addTarget(self, action: #selector(backTap), for: .touchUpInside)
        button.isUserInteractionEnabled = true
        return button
    }()
    private lazy var nameLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Брауни"
        lb.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        lb.font = .systemFont(ofSize: 24, weight: .medium)
        return lb
    }()
    private lazy var descripsionLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Бра́уни — шоколадное пирожное коричневого цвета, прямоугольные куски нарезанного шоколадного пирога."
        lb.numberOfLines = 0
        lb.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        lb.font = .systemFont(ofSize: 16, weight: .regular)
        return lb
    }()
    private lazy var niceAdditionLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Приятное дополнение"
        lb.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        lb.font = .systemFont(ofSize: 24, weight: .semibold)
        return lb
    }()
    private lazy var dishTableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .white
        tv.delegate = self
        tv.dataSource = self
        tv.register(DishTableViewCell.self, forCellReuseIdentifier: CategoryMenuTableViewCell.identifier)
        tv.rowHeight = UITableView.automaticDimension
        return tv
    }()
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = UIColor(red: 0.254, green: 0.254, blue: 0.254, alpha: 1)
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(dishImage)
        view.addSubview(backButton)
        containerView.addSubview(nameLabel)
        containerView.addSubview(descripsionLabel)
        containerView.addSubview(niceAdditionLabel)
        containerView.addSubview(dishTableView)
    }
    
    override func setupConstrains() {
        super.setupConstrains()
        scrollView.snp.makeConstraints { 
            $0.edges.equalToSuperview()
        }
        containerView.snp.makeConstraints {
            $0.edges.width.equalToSuperview()
            $0.height.equalTo(1200)
        }
        dishImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(computedHeight(4))
            $0.leading.trailing.equalToSuperview().inset(computedWidth(0))
        }
        backButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(computedHeight(16))
            $0.leading.equalTo(dishImage.snp.leading ).offset(computedWidth(16))
            $0.height.equalTo(computedHeight(26))
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(dishImage.snp.bottom).offset(computedHeight(24))
            make.leading.equalToSuperview().offset(computedWidth(16))
        }
        descripsionLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(computedHeight(6))
            make.leading.trailing.equalToSuperview().offset(computedWidth(16))
        }
        niceAdditionLabel.snp.makeConstraints { make in
            make.top.equalTo(descripsionLabel.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(computedWidth(16))
        }
        
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension DetailsDishVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishTableViewCell.identifier, for: indexPath) as! DishTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 112
    }
}

// MARK: -  UITableViewDelegate

extension DetailsDishVC:  UITableViewDelegate {
    
}


// MARK: - Selector

extension DetailsDishVC {
    @objc private func backTap() {
        delegate?.dishTap()
        navigationController?.popViewController(animated: true)
        print("print")
    }
}
