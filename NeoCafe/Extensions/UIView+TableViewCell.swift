//
//  UIView+TableViewCell.swift
//  NeoCafe
//
//  Created by Adinay on 21/6/23.
//

import UIKit

extension UIView {
    func addCornerRadius(_ radius: CGFloat) {
            layer.cornerRadius = radius
            layer.masksToBounds = true
    }
}
