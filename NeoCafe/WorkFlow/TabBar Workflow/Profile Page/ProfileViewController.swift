//
//  ProfileViewController.swift
//  NeoCafe
//
//  Created by Adinay on 8/6/23.
//

import UIKit
import SnapKit
import SwiftDate

class ProfileViewController: BaseViewController {
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(.init(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(backTap), for: .touchUpInside)
        button.isUserInteractionEnabled = true
        return button
    }()
    
    private lazy var profileLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textAlignment = .center
        label.textColor = UIColor(named: "blue")
        label.text = "Профиль"
        return label
    }()
    
    private lazy var editImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "square.and.pencil.circle.fill")
        iv.isUserInteractionEnabled = true
        let imageTap = UITapGestureRecognizer(target: self,
                                              action: #selector(tapEdit))
        iv.addGestureRecognizer((imageTap))
        return iv
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.textAlignment = .left
        label.textColor = UIColor(named: "blue")!
        label.text = "Себастьян"
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: view.frame.width, height: 105)
        layout.minimumLineSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(BonusCollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "BonusCollectionViewCell")
        collectionView.register(ProfileOrdersCollectionViewCell.self)
        collectionView.register(Header.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header")
        
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    // MARK: - Private Props
    
    private let viewModel = ProfileOrderViewModel()
    private var items: [ProfileOrdersCollectionViewCell.Props] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchOrdersData()
    }
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = .white
        view.addSubview(backButton)
        view.addSubview(profileLabel)
        view.addSubview(editImage)
        view.addSubview(nameLabel)
        view.addSubview(collectionView)
    }
    
    override func setupConstrains() {
        super.setupConstrains()
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(computedHeight(50))
            $0.leading.equalToSuperview().offset(computedWidth(24))
        }
        profileLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(computedHeight(40))
            $0.leading.equalTo(backButton.snp.leading).offset(computedWidth(126))
            $0.height.equalTo(computedHeight(40))
        }
        editImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(computedHeight(46))
            $0.trailing.equalToSuperview().inset(computedWidth(20))
            $0.height.width.equalTo(36)
        }
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(computedHeight(58))
            $0.leading.equalToSuperview().offset(computedWidth(16))
            $0.height.equalTo(computedHeight(24))
        }
        collectionView.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(computedHeight(4))
            $0.bottom.trailing.leading.equalToSuperview()
        }
    }
    
    func fetchOrdersData () {
        viewModel.fetchOrders { [weak self] response in
            guard let self else { return }
            
            items = response.map {
                .init(
                    isCompleted: $0.isCompleted ?? false,
                    branchImageUrl: $0.branch?.imageUrl,
                    branch: $0.branch?.name ?? "n/n",
                    products: $0.dishes?.compactMap { $0.name }.joined(separator: ", ") ?? "n/n",
                    date: $0.createdAt?.toDate()?.toFormat("dd MMMM", locale: Locales.russian) ?? "n/n"
                )
            }
            collectionView.reloadData()
        }
    }
}


// MARK: - UICollectionViewDelegateFlowLayout, UICollectionViewDataSource

extension ProfileViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return items.filter({ $0.isCompleted  }).isEmpty ? 2 : 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 1:
            return items.filter({ !$0.isCompleted} ).count
        case 2:
            return items.filter({ $0.isCompleted  }).count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var item: ProfileOrdersCollectionViewCell.Props?
        
        switch indexPath.section {
        case 1:
            item = items.filter({ $0.isCompleted == false })[indexPath.row]
        case 2:
            item = items.filter({ $0.isCompleted == true })[indexPath.row]
            
        default:
            return UICollectionViewCell()
        }
        guard let item else { return UICollectionViewCell() }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileOrdersCollectionViewCell.identifier, for: indexPath) as! ProfileOrdersCollectionViewCell
        cell.render(item)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeuReusableView(ViewType: Header.self, type: .UICollectionElementKindSectionHeader, for: indexPath)
        if indexPath.section == 0 {
            
            let headerView = collectionView.dequeuReusableView(ViewType: BonusCollectionViewCell.self, type: .UICollectionElementKindSectionHeader, for: indexPath)
            return headerView
            
        } else if indexPath.section == 1 {
            header.display(with: .current)
            return header
        }
        header.display(with: .closed)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: 170, height: 130)
        }
        return CGSize(width: 170, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}


// MARK: - Selectors

extension ProfileViewController {
    @objc func backTap() {
        print("")
    }
    
    @objc func tapEdit() {
        let vc = ProfileEditViewController()
        navigationController?.pushViewController(vc, animated: true)
        print("")
    }
}

