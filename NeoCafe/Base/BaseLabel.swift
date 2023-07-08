//
//  BaseLabel.swift
//  NeoCafe
//
//  Created by Adinay on 6/6/23.
//

import UIKit
import SnapKit

class BaseLabel: UILabel {
    init() {
        super.init(frame: .zero)
//        setupConstrains()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func mainSetup(_ text: String){
        self.text = text
        self.textColor = UIColor(red: 0.759, green: 0.757, blue: 0.767, alpha: 1)
        self.font = .systemFont(ofSize: 14, weight: .regular)
        self.numberOfLines = 0
    }
    
//    func setupConstrains(){
//        snp.makeConstraints{
//            $0.height.equalTo(computedHeight(14))
//        }
//    }
}

