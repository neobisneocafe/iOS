//
//  String+Extension.swift
//  NeoCafe
//
//  Created by Adinay on 26/6/23.
//

import UIKit

extension String {
    enum ValidTypes {
        case name
    }
    enum Regex: String {
        case name = "[a-zA-Z]{1,}"
    }
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    func isValidPassword() -> Bool {
        return self.count >= 4
    }
    func isValid(validType: ValidTypes) -> Bool {
        let format = "SELF MATCHES %@"
        var regex = ""
        switch validType {
        case .name:
            regex = Regex.name.rawValue
        }
        return NSPredicate(format: format, regex).evaluate(with: self)
    }
}

//protocol ProfileEditViewControllerProtocol {
//    func editProfileAlert(completion: @escaping (Bool) -> Void)
//    func signOutProfileAlert(completion: @escaping (Bool) -> Void)
//}
//
//extension ProfileEditViewController: ProfileEditViewControllerProtocol {
//
//    func editProfileAlert(completion: @escaping (Bool) -> Void) {
//        let alert = UIAlertController(
//            title: "Изменения не сохранены",
//            message: "Хотите покинуть страницу редактирования?",
//            preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "Да", style: .default) { _ in
//            completion(true)
//        })
//        alert.addAction(UIAlertAction(title: "Нет", style: .cancel) { _ in
//            completion(false)
//        })
//        present(alert, animated: true)
//    }
//
//    func signOutProfileAlert(completion: @escaping (Bool) -> Void) {
//        let alert = UIAlertController(
//            title: "Выход из учетной записи",
//            message: "Вы уверены, что хотите выйти из своей учетной записи?",
//            preferredStyle: .alert)
//
//        let cancelAction = UIAlertAction(
//            title: "Отмена",
//            style: .cancel) { _ in
//                // Do nothing
//                completion(false)
//            }
//
//        let signOutAction = UIAlertAction(
//            title: "Выйти",
//            style: .destructive) { _ in
//                // Sign out of the account
//                DSGenerator.sharedInstance.removeAll()
//                self.appDelegate.launchApp()
//                completion(true)
//            }
//        alert.addAction(cancelAction)
//        alert.addAction(signOutAction)
//        present(alert, animated: true, completion: nil)
//    }
//}





extension ProfileEditViewController {
    func editProfileAlert() {
        let alert = UIAlertController(
            title: "Изменения не сохранены",
            message: "Хотите покинуть страницу редактирования?",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Да", style: .default))
        alert.addAction(UIAlertAction(title: "Нет", style: .cancel))
        present(alert, animated: true)
    }

}


extension ProfileEditViewController {
    func signOutProfileAlert() {
        let alert = UIAlertController(
            title: "Выход из учетной записи",
            message: "Вы уверены, что хотите выйти из своей учетной записи?",
            preferredStyle: .alert)

        let cancelAction = UIAlertAction(
            title: "Отмена",
            style: .cancel) { _ in
                // Do nothing
            }

        let signOutAction = UIAlertAction(
            title: "Выйти",
            style: .destructive) { _ in
                // Sign out of the account
                DSGenerator.sharedInstance.removeAll()
                self.appDelegate.launchApp()
            }
        alert.addAction(cancelAction)
        alert.addAction(signOutAction)
        present(alert, animated: true, completion: nil)
    }
}


//v\completion: @escaping (()->Void)
