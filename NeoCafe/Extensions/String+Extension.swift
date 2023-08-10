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
    
    func signOutProfileAlert() {
        let alert = UIAlertController(
            title: "Выход из учетной записи",
            message: "Вы уверены, что хотите выйти из своей учетной записи?",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Да", style: .default))
        alert.addAction(UIAlertAction(title: "Нет", style: .cancel))
        present(alert, animated: true)
    }
}



//        DSGenerator.sharedInstance.removeAll()  // Удаление Пользователя
//        self.appDelegate.launchApp()
//        signOutProfileAlert()
//        print("tapLogOut")
