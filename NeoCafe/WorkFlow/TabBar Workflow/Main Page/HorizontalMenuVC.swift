//
//  HorizontalMenuVC.swift
//  NeoCafe
//
//  Created by Adinay on 6/7/23.
//

import UIKit
import SnapKit

class HorizontalMenuVC: BaseViewController {
    
    private let horizontalMenuCollectionView = HorizontalMenuCollectionView()
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = .white
        view.addSubview(horizontalMenuCollectionView)
    }
    
    override func setupConstrains() {
        super.setupConstrains()
        horizontalMenuCollectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(computedHeight(62))
            make.leading.trailing.equalToSuperview().inset(computedWidth(16))
            make.height.equalTo(computedHeight(40))
        }
    }
}
