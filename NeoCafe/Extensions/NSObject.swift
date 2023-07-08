//
//  NSObject.swift
//  NeoCafe
//
//  Created by Adinay on 4/6/23.
//

import UIKit

extension NSObject {
    var screenHeight: CGFloat{
        return UIScreen.main.bounds.height
    }
    var screenWidth: CGFloat{
        return UIScreen.main.bounds.width
    }
    func computedHeight(_ height: CGFloat) -> CGFloat{
        return screenHeight * height / 667
    }
    func computedWidth(_ width: CGFloat) -> CGFloat{
        return screenWidth * width / 375
    }
}
