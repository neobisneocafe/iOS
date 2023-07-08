//
//  AlertController.swift
//  NeoCafe
//
//  Created by Adinay on 3/7/23.
//

//import UIKit
//import BLTNITEMMANAGER
//
//protocol AlertControllerDelegate: AnyObject {
//    func didTapYes()
//    func didTapNo()
//}
//
//class AlertController: NSObject {
//    private var bulletinManager: BLTNItemManager?
//    weak var delegate: AlertControllerDelegate?
//    
//    func showAlert() {
//        let alertPage = createAlertPage()
//        bulletinManager = BLTNItemManager(rootItem: alertPage)
//        bulletinManager?.backgroundViewStyle = .dimmed
//        
//  if let rootViewController = UIApplication.shared.windows.first?.rootViewController {
//         bulletinManager?.showBulletin(above: rootViewController)
//  }
//    }
//    
//    private func createAlertPage() -> BLTNPageItem {
//        let alertPage = BLTNPageItem(title: "Заголовок")
//        alertPage.descriptionText = "Описание"
//        
//        let actionButton = BLTNActionItem(title: "Да")
//        let alternativeButton = BLTNActionItem(title: "Нет")
//        
//        alertPage.actionButtonTitle = actionButton.title
//        alertPage.alternativeButtonTitle = alternativeButton.title
//        
//        actionButton.actionHandler = { [weak self] item in
//            self?.delegate?.didTapYes()
//            item.manager?.dismissBulletin()
//        }
//        
//        alternativeButton.actionHandler = { [weak self] item in
//            self?.delegate?.didTapNo()
//            item.manager?.dismissBulletin()
//        }
//        
//        alertPage.actionButton = actionButton
//        alertPage.alternativeButton = alternativeButton
//        
//        return alertPage
//    }
//}
//
//
//
