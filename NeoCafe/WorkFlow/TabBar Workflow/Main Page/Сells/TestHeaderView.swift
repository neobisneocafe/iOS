//
//  TestHeaderView.swift
//  NeoCafe
//
//  Created by Adinay on 10/6/23.
//

//dispetcherizasia

import UIKit

final class TestHeaderView: UICollectionReusableView {
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 20)
        view.text = "Some Text"
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func display(_ title: String) {
        titleLabel.text = title
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.top.bottom.equalToSuperview().inset(12)
        }
    }
}
