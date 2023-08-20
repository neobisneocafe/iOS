//
//  DetailsDishVC.swift
//  NeoCafe
//
//  Created by Adinay on 12/7/23.
//


import Kingfisher
import SnapKit
import SwiftBoost
import UIKit

protocol DishViewControllerDetailsDelegate: AnyObject {
    func dishTap()
}

class DishViewControllerDetails: BaseViewController {
    weak var delegate: DishViewControllerDetailsDelegate?

    private let id: Int

    private let viewModel = DishDetailsVM()

    private var addonsItems: [AddonDishesResponseElement] = []
    
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
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
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
        tv.backgroundColor = UIColor(red: 0.254, green: 0.254, blue: 0.254, alpha: 1)
        tv.delegate = self
        tv.dataSource = self
        tv.register(DishTableViewCell.self,
                    forCellReuseIdentifier: DishTableViewCell.identifier)
        tv.rowHeight = UITableView.automaticDimension
        return tv
    }()

    init(id: Int) {
        self.id = id
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.fetchDish(id: id) { [weak self] item in
            guard let self else { return }

            nameLabel.text = item.name
            descripsionLabel.text = item.description
            dishImage.kf.setImage(with: URL(string: item.image?.url ?? ""))
        }

        viewModel.fetchAddons { [weak self] items in
            self?.addonsItems = items
            self?.dishTableView.reloadData()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }

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
//        view.addSubview(dishTableView)
        containerView.addSubview(dishTableView)
    }
    
    override func setupConstrains() {
        super.setupConstrains()
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        containerView.snp.makeConstraints {
            $0.edges.width.equalToSuperview()
            $0.height.equalTo(1600)
        }
        dishImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(computedWidth(0))

            $0.height.equalTo(225)
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
        dishTableView.snp.makeConstraints { make in
            make.top.equalTo(niceAdditionLabel.snp.bottom).offset(computedHeight(16))
            make.leading.trailing.equalToSuperview().inset(computedWidth(0))
            make.bottom.equalToSuperview().offset(computedHeight(-20))
        }
    }
}

// MARK: - UITableViewDataSource

extension DishViewControllerDetails: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(addonsItems.count)
        return addonsItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishTableViewCell.identifier, for: indexPath) as! DishTableViewCell
        let item = addonsItems[indexPath.row]
        cell.render(.init(imageUrl: "", name: item.name ?? "n/n", description: item.description ?? "n/n", price: String(item.price ?? -1)))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 112
    }
}

// MARK: -  UITableViewDelegate

extension DishViewControllerDetails:  UITableViewDelegate {
    
}


// MARK: - Selectors

extension DishViewControllerDetails {
    @objc private func backTap() {
        delegate?.dishTap()
        navigationController?.popViewController(animated: true)
        print("print")
    }
}
