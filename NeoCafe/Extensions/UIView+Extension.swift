//
//  UIView+Extension.swift
//  NeoCafe
//
//  Created by Adinay on 10/6/23.
//

import UIKit

extension UIView {
    func dropShadow(with shadowColor: UIColor,
                    shadowOpacity: Float,
                    shadowRadius: CGFloat,
                    shadowOffset: CGSize,
                    cornerRadius: CGFloat? = nil) {
        layer.masksToBounds = false
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = shadowRadius
        layer.shouldRasterize = true
        if let radius = cornerRadius {
            layer.cornerRadius = radius
        }
        layer.rasterizationScale = true ? UIScreen.main.scale : 1
    }
}

