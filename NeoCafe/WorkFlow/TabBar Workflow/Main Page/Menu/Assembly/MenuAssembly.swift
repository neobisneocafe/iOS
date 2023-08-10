//
//  MenuAssembly.swift
//  NeoCafe
//
//  Created by Adinay on 31/7/23.
//


import UIKit

enum MenuAssembly {
    static func create() -> UIViewController {
        let router = MenuRouter()
        let viewModel = MenuViewModel(router: router)
        let vc = MenuViewController(viewModel: viewModel)
        router.viewController = vc

        return vc
    }
}
