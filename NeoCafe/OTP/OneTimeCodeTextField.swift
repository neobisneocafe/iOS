//
//  OneTimeCodeTextField.swift
//  NeoCafe
//
//  Created by Adinay on 5/6/23.
//

import UIKit

final class OneTimeCodeTextField: UITextField {
    
    // MARK: - Замыкание
    
    var didEnterLastDigit: ((String) -> Void)?
    
    var defaultCharacter = "-"
    
    private var isConfigured = false
    private var digitLabels = [UILabel]()
    
    private lazy var tapRecognizer: UITapGestureRecognizer = {
        let recognizer = UITapGestureRecognizer()
        recognizer.addTarget(self, action: #selector(becomeFirstResponder))
        return recognizer
    }()
    
    // MARK: - Количество Текстовых Полей
    
   func configure(with slotCount: Int = 4) {
        guard isConfigured == false else { return }
        isConfigured.toggle()
        configureTextField()
        let labelsStackView = createLabelsStackView(with: slotCount)
        addSubview(labelsStackView)
        addGestureRecognizer(tapRecognizer)
        
        NSLayoutConstraint.activate([
            labelsStackView.topAnchor.constraint(equalTo: topAnchor),
            labelsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            labelsStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            labelsStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    // MARK: - Настройка Текстового Поля
    
    private func configureTextField() {
        tintColor = .clear
        textColor = .clear
        keyboardType = .numberPad
        textContentType = .oneTimeCode
        addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        delegate = self
    }
    
    // MARK: - StackView
    
    private func createLabelsStackView(with count: Int) -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 6
        
        for _ in 1 ... count {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 40, weight: .regular)
            label.isUserInteractionEnabled = true
            label.text = defaultCharacter
            stackView.addArrangedSubview(label)
            digitLabels.append(label)
        }
        return stackView
    }
}


// MARK: - Selectors

extension OneTimeCodeTextField {
    @objc private func textDidChange() {
        
        // MARK: - Доступ к Тексту
        
        guard let text = self.text, text.count <= digitLabels.count else { return }
        
        // MARK: - Обновление Лейблов
        
        for i in 0 ..< digitLabels.count {
            let currentLabel = digitLabels[i]
            
            if i < text.count {
                let index = text.index(text.startIndex, offsetBy: i)
                currentLabel.text = String(text[index])
            } else {
                currentLabel.text = defaultCharacter
            }
        }
        
        // MARK: - Закрытие Клавиатуры
        
        if text.count == digitLabels.count {
            didEnterLastDigit?(text)
        }
    }
}


// MARK: - UITextFieldDelegate

extension OneTimeCodeTextField: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let characterCount = textField.text?.count else { return false }
        return characterCount < digitLabels.count || string == ""
    }
}
