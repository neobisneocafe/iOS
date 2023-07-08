//
//  LocationsViewController.swift
//  NeoCafe
//
//  Created by Adinay on 8/6/23.
//

import UIKit
import SnapKit

class LocationsViewController: BaseViewController {
    private lazy var backImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "back")
        iv.isUserInteractionEnabled = true
        let imageTap = UITapGestureRecognizer(target: self, action: #selector(backTap))
        iv.addGestureRecognizer((imageTap))
        return iv
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textAlignment = .center
        label.textColor = UIColor(red: 0.157, green: 0.224, blue: 0.322, alpha: 1)
        label.text = "Филиалы"
        return label
    }()
    
    private lazy var pushButton: UIButton = {
        let button = UIButton()
        button.setImage(.init(named: "push"), for: .normal)
        button.addTarget(self, action: #selector(pushTap), for: .touchUpInside)
        button.isUserInteractionEnabled = true
        return button
    }()
    
    private lazy var branchLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        label.textColor = UIColor(red: 0.157, green: 0.224, blue: 0.322, alpha: 1)
        label.text = "Филиалы"
        return label
    }()
    
    private lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.delegate = self
        view.dataSource = self
        view.registerCollectionReusable(CellType: LocationsCell.self)
        view.backgroundColor = .white
        return view
    }()

    override func setupViews() {
        super.setupViews()
        view.backgroundColor = .white
        view.addSubview(backImage)
        view.addSubview(titleLabel)
        view.addSubview(pushButton)
        view.addSubview(branchLabel)
        view.addSubview(collection)
    }
    
    override func setupConstrains() {
        backImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(computedHeight(50))
            $0.leading.equalToSuperview().offset(computedWidth(24))
        }
        titleLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(computedHeight(40))
            make.leading.equalTo(backImage.snp.leading).offset(132)
            make.height.equalTo(computedHeight(40))
        }
        pushButton.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(computedHeight(50))
            make.trailing.equalToSuperview().inset(computedWidth(16))
        }
        branchLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(computedHeight(82))
            $0.leading.equalToSuperview().offset(computedWidth(16))
            $0.height.equalTo(computedHeight(34))
        }
        collection.snp.makeConstraints {
            $0.top.equalTo(branchLabel.snp.bottom).offset(computedHeight(10))
            $0.bottom.trailing.leading.equalToSuperview()
        }
    }
}


// MARK: - UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

extension LocationsViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LocationsCell.identifier, for: indexPath) as! LocationsCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize { CGSize(width: screenWidth, height: 195) }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize { CGSize(width: screenWidth, height: 40) }
}



// MARK: - Selector

extension LocationsViewController {
    @objc func backTap() {
//        let vc = MainViewController()
        navigationController?.popViewController(animated: true)
    }
    
    @objc func pushTap(){
        let vc = HorizontalMenuVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}
