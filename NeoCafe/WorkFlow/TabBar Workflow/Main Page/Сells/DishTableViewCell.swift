//
//  DishTableViewCell.swift
//  NeoCafe
//
//  Created by Adinay on 12/7/23.
//

import UIKit

class DishTableViewCell: UITableViewCell {
        static let identifier = "DishTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        setupViews()
        setupConstrains()
    }
    
    private func setupViews() {
        
    }
    
    private func setupConstrains() {
        
    }
}
