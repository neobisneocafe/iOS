//
//  BasicMainLabel.swift
//  NeoCafe
//
//  Created by Adinay on 4/6/23.
//

import UIKit
import SnapKit

final class BasicMainLabel: UILabel {
    init() {
        super.init(frame: .zero)
        setupConstrains()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func mainSetup(_ text: String) {
        self.text = text
        self.textColor = UIColor(red: 0.157, green: 0.224, blue: 0.322, alpha: 1)
        self.font = .systemFont(ofSize: 34, weight: .bold)
        self.numberOfLines = 0
        self.textAlignment = .center
    }
    func setupConstrains(){
        snp.makeConstraints {
            $0.height.equalTo(computedHeight(34))
        }
    }
}
