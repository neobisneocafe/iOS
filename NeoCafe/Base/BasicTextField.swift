//
//  BasicTextField.swift
//  NeoCafe
//
//  Created by Adinay on 5/6/23.
//

import UIKit
import SnapKit

final class BasicTextField: UITextField {
    init() {
        super.init(frame: .zero)
        setupConstrains()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func mainSetup(_ text: String) {
        backgroundColor = UIColor(red: 0.931, green: 0.931, blue: 0.931, alpha: 1)
        placeholder =  text
        font = .systemFont(ofSize: 16, weight: .regular)
        textColor = UIColor(red: 0.157, green: 0.224, blue: 0.322, alpha: 1)
        autocorrectionType = .no
        autocapitalizationType = .none
        self.layer.cornerRadius = 26
        self.layer.masksToBounds = true
        delegate = self
    }
    
    func mainTextField(_ text: String) {
        backgroundColor = .white
        font = .systemFont(ofSize: 16, weight: .regular)
        placeholder = text
        textColor = UIColor(red: 0.157, green: 0.224, blue: 0.322, alpha: 1)
        layer.shadowRadius = 0
        layer.shadowOpacity = 1
        layer.shadowColor = UIColor(red: 1, green: 0.649, blue: 0.5, alpha: 1).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1)
    }
    
    
    func setupConstrains(){
        snp.makeConstraints{
            $0.height.equalTo(computedHeight(56))
        }
    }
    
}

extension BasicTextField: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}



extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
