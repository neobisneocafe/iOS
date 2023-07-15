//
//  TextField.swift
//  NeoCafe
//
//  Created by Adinay on 4/6/23.
//

import UIKit
enum TextFieldImageSide {
    case leading
    case traling
}

@available(iOS 13.4, *)
extension UITextField {
    func setUpImage(imageName: String, on side: TextFieldImageSide) {
        let imageView = UIImageView(frame: CGRect(x: 10, y: 5, width: 20, height: 20))
        if let imageWithSystemName = UIImage(systemName: imageName) {
            imageView.tintColor = .gray
            imageView.image = imageWithSystemName
        } else {
            imageView.tintColor = .black
            imageView.image = UIImage(named: imageName)
        }
        
        let imageContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 30))
        imageContainerView.addSubview(imageView)
        
        switch side {
        case .leading:
            leftView = imageContainerView
            leftViewMode = .always
        case .traling:
            rightView = imageContainerView
            rightViewMode = .always
        }
    }
     
    // MARK: - UIDatePicker
    func addInputDatePicker(target: Any, selector: Selector) {
        let screenWidth = UIScreen.main.bounds.width
        
       // MARK: -  Добавить DatePicker в inputView
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 216))
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "ru_RU")
        self.inputView = datePicker
        
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 50))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelBarButton = UIBarButtonItem(title: "Отмена", style: .plain, target: self, action: #selector(cancelPressed))
        let doneBarButton = UIBarButtonItem(title: "Готова", style: .plain, target: target, action: selector)
        toolBar.setItems([cancelBarButton, flexibleSpace, doneBarButton], animated: true)
        self.inputAccessoryView = toolBar
    }

    @objc func cancelPressed() {
        self.resignFirstResponder()
    }
    
}
