//
//  TabBar.swift
//  NeoCafe
//
//  Created by Adinay on 8/6/23.
//

import UIKit
import FittedSheets

 enum TabBar: CaseIterable {
    case Home
    case Basket
    case QrCode
    case Locations
    case Profile
    
    var tabBarItem: UITabBarItem {
        switch self {
        case .Home:
            return UITabBarItem(title: nil, image: UIImage(named: "home"), selectedImage: nil)
        case .Basket:
            return UITabBarItem(title: nil, image: UIImage(named: "basket"), selectedImage: nil)
        case .QrCode:
            return UITabBarItem(title: nil, image: UIImage(), selectedImage: nil)
        case .Locations:
            return UITabBarItem(title: nil, image: UIImage(named: "location"), selectedImage: nil)
        case .Profile:
            return UITabBarItem(title: nil, image: UIImage(named: "profile"), selectedImage: nil)
        }
    }
    
    var viewController: UINavigationController {
        var vc = UINavigationController()
        switch self {
        case .Home:
            vc = UINavigationController(rootViewController: MainViewController().self)
        case .Basket:
            vc = UINavigationController(rootViewController: BasketViewController().self)
        case .QrCode:
            vc = UINavigationController()
        case .Locations:
            vc = UINavigationController(rootViewController:LocationsViewController().self)
        case .Profile:
            vc = UINavigationController(rootViewController: ProfileViewController().self)
        }
        
        vc.setNavigationBarHidden(false, animated: false)
        vc.tabBarItem = tabBarItem
        vc.navigationBar.isHidden = true
        return vc
    }
}


// MARK: - UITabBarController

final class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        setUpMiddleButton()
    }
    
    private func setUp() {
        viewControllers = TabBar.allCases.map { $0.viewController }
        tabBar.itemPositioning = .centered
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        tabBar.tintColor = .orange
        tabBar.unselectedItemTintColor = .black
        tabBar.backgroundColor = .white // UIColor(named: "F8F8F8")!
        tabBar.itemWidth = (tabBar.frame.size.width/4)
        tabBarItem.imageInsets = .init(top: 12, left: 24, bottom: 6, right: 24)
        
        let shadowColor = UIColor(named: "FF8B5B")!
            .withAlphaComponent(0.08)
        tabBar.dropShadow(with: shadowColor,
                          shadowOpacity: 1,
                          shadowRadius: 30,
                          shadowOffset: .zero)
    }
    
    private func setUpMiddleButton() {
        let qrBtn = makeQRButton()
        view.addSubview(qrBtn)
        NSLayoutConstraint.activate([
            qrBtn.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor),
            qrBtn.bottomAnchor.constraint(equalTo: tabBar.topAnchor, constant: 34)
        ])
    }
    
    private func makeQRButton() -> UIButton {
        let qrBtn = UIButton()
        qrBtn.translatesAutoresizingMaskIntoConstraints = false
        qrBtn.setImage(.init(named: "qr"), for: .normal)
        qrBtn.addTarget(self, action: #selector(qrButtonAction), for: .touchUpInside)
        NSLayoutConstraint.activate([
            qrBtn.heightAnchor.constraint(equalToConstant: computedHeight(68)),
            qrBtn.widthAnchor.constraint(equalToConstant: computedWidth(68))
        ])
        return qrBtn
    }
}


// MARK: - Selector

extension MainTabBarController {
    @objc private func qrButtonAction(sender: UIButton) {
        let qrCodeVC = UINavigationController(rootViewController: QRCodeViewController().self)
        let controllerSheet = SheetViewController(controller: qrCodeVC, sizes: [.percent(0.8)])
        controllerSheet.cornerRadius = 44
        controllerSheet.allowPullingPastMaxHeight = false
        present(controllerSheet, animated: true)
    }
}
