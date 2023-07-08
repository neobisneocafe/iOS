//
//  ProfileViewController.swift
//  NeoCafe
//
//  Created by Adinay on 8/6/23.
//

import UIKit
import SnapKit

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
    
    private lazy var logOutButton: UIButton = {
        let button = UIButton()
        button.setImage(.init(named: "signOut"), for: .normal)
        button.addTarget(self, action: #selector(tapLogOut), for: .touchUpInside)
        button.isUserInteractionEnabled = true
        return button
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width, height: 105)
        layout.minimumLineSpacing = 10
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.delegate = self
        view.dataSource = self
        view.registerReusableView(ViewType: BonusCollectionViewCell.self,  type: .UICollectionElementKindSectionHeader)
        view.registerCollectionReusable(CellType: ProfileOrdersCollectionViewCell.self)
                view.registerReusableView(ViewType: Header.self, type: .UICollectionElementKindSectionHeader)
        view.backgroundColor = .white
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.textAlignment = .left
        label.textColor = UIColor(named: "blue")!
        label.text = "Себастьян"
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
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = .white
        view.addSubview(backButton)
        view.addSubview(profileLabel)
        view.addSubview(logOutButton)
        view.addSubview(nameLabel)
        view.addSubview(editImage)
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
            $0.leading.equalTo(backButton.snp.leading).offset(computedWidth(132))
            $0.height.equalTo(computedHeight(40))
        }
        logOutButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(computedHeight(50))
            $0.trailing.equalToSuperview().inset(computedWidth(20))
        }
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(computedHeight(86))
            $0.leading.equalToSuperview().offset(computedWidth(16))
            $0.height.equalTo(computedHeight(24))
        }
        editImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(computedHeight(90))
            $0.trailing.equalToSuperview().offset(computedWidth(-200))
        }
        collectionView.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(computedHeight(16))
            $0.bottom.trailing.leading.equalToSuperview()
        }
    }
}


// MARK: - UITableViewDelegate, UITableViewDataSource

extension ProfileViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 0
//        } else if section == 1 {
////            return currentOrders.count
        }
        return 3
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueIdentifiableCell(ProfileOrdersCollectionViewCell.self, for: indexPath)
        if indexPath.section == 0 {
            let cell = UICollectionViewCell()
            return cell
        } else if indexPath.section == 1 {
//            cell.display([indexPath.row])
            return cell
        } else {
//            cell.display(completedOrders[indexPath.row])
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeuReusableView(ViewType: Header.self, type: .UICollectionElementKindSectionHeader, for: indexPath)
        if indexPath.section == 0 {
            
            let headerView = collectionView.dequeuReusableView(ViewType: BonusCollectionViewCell.self, type: .UICollectionElementKindSectionHeader, for: indexPath)
//            headerView.delegate = self
//            headerView.display(bonus: bonus)
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


// MARK: - Selector

extension ProfileViewController {
    @objc func backTap() {
        print("asd")
        
    }
    @objc func tapLogOut() {
        print("gkfp")
    }
    @objc func tapEdit() {
        let vc = ProfileEditViewController()
        navigationController?.pushViewController(vc, animated: true)
        print("edit")
    }
}




    //        } else if indexPath.section == 1 {
    //            let cell = tableView.dequeueIdentifiableCell(ProfileOrdersTableViewCell.self, for: indexPath)
    //            return cell
    //        } else {
    //            let cell = tableView.dequeueIdentifiableCell(ProfileOrdersTableViewCell.self, for: indexPath)
    //            return cell
    //        }
//}

//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) ->  UIView? {
//        if section == 0 {
//            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Header") as! Header
//            return headerView
//        }
//    }; else if section == 1 {
//        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "BonusTableViewCell") as! BonusTableViewCell
//
//        return headerView
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if section == 0 {
//            return 0
//        } else if section == 1 {
//        }
//    }
