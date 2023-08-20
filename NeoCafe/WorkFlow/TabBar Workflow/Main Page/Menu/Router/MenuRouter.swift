//
//  MenuRouter.swift
//  NeoCafe
//
//  Created by Adinay on 31/7/23.
//

import UIKit

final class MenuRouter {
    enum RouterType {
        case detail(Int)
    }

    weak var viewController: UIViewController?

    func routeTo(_ type: RouterType) {
        switch type {
        case .detail(let id):
            let vc = DishViewControllerDetails(id: id)
            viewController?.navigationController?.pushViewController(vc)
        }
    }
}
