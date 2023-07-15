//
//  AlertController.swift
//  NeoCafe
//
//  Created by Adinay on 3/7/23.
//

import UIKit

//class AlertController: UIAlertController {
//
//func showAlertAndOpenApp(in viewController: UIViewController) {
//       let alertController = UIAlertController(title: "Перейти в другое приложение", message: "Вы хотите перейти в другое приложение?", preferredStyle: .alert)
//
//       let yesAction = UIAlertAction(title: "Да", style: .default) { (_) in
//           // Открытие другого приложения
//           if let url = URL(string: "https://2gis.kg/bishkek") {
//               UIApplication.shared.open(url, options: [:], completionHandler: nil)
//           }
//       }
//
//       let noAction = UIAlertAction(title: "Нет", style: .cancel, handler: nil)
//
//       alertController.addAction(yesAction)
//       alertController.addAction(noAction)
//
//       viewController.present(alertController, animated: true)
//   }
//}

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
