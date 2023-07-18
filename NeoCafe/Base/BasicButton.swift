//
//  BasicButton.swift
//  NeoCafe
//
//  Created by Adinay on 4/6/23.
//

import UIKit
import SnapKit

final class BasicButton: UIButton {
    init() {
        super.init(frame: .zero)
        setupConstrains()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func mainSetup(_ text: String) {
        self.setTitle(text, for: .normal)
        self.backgroundColor = UIColor(red: 1, green: 0.545, blue: 0.358, alpha: 1)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        self.layer.cornerRadius = 25
        self.layer.masksToBounds = true
    }
    
    func setupConstrains(){
        snp.makeConstraints{
            $0.height.equalTo(computedHeight(56))
        }
    }
}
