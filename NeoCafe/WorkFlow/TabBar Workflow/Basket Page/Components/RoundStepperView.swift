//
//  RoundStepperView.swift
//  NeoCafe
//
//  Created by Adinay on 28/6/23.
//

import UIKit
import SnapKit

protocol HidableStepperDelegate: AnyObject {
    func stepperWillHideDecreaseButton()
    func stepperWillRevealDecreaseButton()
    func updateValue(with count: Int)
}

final class RoundStepperView: UIControl {
    weak var delegate: HidableStepperDelegate?
    
    public enum ButtonType {
        case circular
    }
    
    var type: ButtonType = .circular
    
    var quantityOfItems: Int = 0 {
        didSet {
            delegate?.updateValue(with: quantityOfItems)
            quantityOfItemsLabel.text = "\(quantityOfItems) \(quantityOfItemsUnityOfMeasure)"
            layoutSubviews()
        }
    }
    
    var minimumNumberOfItems: Int = 0
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        sharedInit()
    }
    
    private lazy var decreaseButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(decrease), for: [.touchDragExit, .touchCancel, .touchUpInside, .touchUpOutside])
        button.setTitle(" - ", for: .normal)
        return button
    }()
    
    private lazy var additionButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(add), for: [.touchDragExit, .touchCancel, .touchUpInside, .touchUpOutside])
        button.setTitle(" + ", for: .normal)
        return button
    }()
    
    private lazy var spacerView: UIView = {
        let spacerView: UIView = UIView()
        spacerView.backgroundColor = stepperBackgroundColor
        return spacerView
    }()
    
    private lazy var quantityOfItemsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = quantityOfItemsUnityOfMeasure
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.3
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = UIColor.black
        return label
    }()
    
    var additionButtonColor: UIColor = UIColor(named: "FF8B5B") ?? UIColor.orange  {
        didSet {
            additionButton.backgroundColor = additionButtonColor
        }
    }
    
    var decreaseButtonColor: UIColor = UIColor(named: "FF8B5B") ?? UIColor.orange {
        didSet {
            decreaseButton.backgroundColor = decreaseButtonColor
        }
    }
    
    var stepperBackgroundColor: UIColor = .clear {
        didSet {
            backgroundColor = stepperBackgroundColor
        }
    }
    
    var quantityOfItemsLabelFont: UIFont = UIFont.systemFont(ofSize: 14) {
        didSet {
            quantityOfItemsLabel.font = quantityOfItemsLabelFont
        }
    }
    
    var quantityOfItemsUnityOfMeasure: String = ""
    var hiddableView: UIView!
    
    private func sharedInit() {
        clipsToBounds = true
        hiddableView = UIView()
        spacerView.addSubview(quantityOfItemsLabel)
        hiddableView.addSubview(spacerView)
        hiddableView.addSubview(decreaseButton)
        hiddableView.clipsToBounds = false
        addSubview(hiddableView)
        addSubview(additionButton)
    }
    
    public override func layoutSubviews() {
        let buttonWidth = frame.height
        decreaseButton.frame = CGRect(x: 0, y: 0, width: buttonWidth, height: buttonWidth)
        additionButton.frame = CGRect(x: frame.width - buttonWidth, y: 0, width: buttonWidth, height: buttonWidth)
        let hidableViewWidth = frame.width - frame.height
        if quantityOfItems > 0 {
            hiddableView.frame = CGRect(x: 0, y: 0, width: hidableViewWidth, height: frame.height)
        }
        spacerView.frame = CGRect(x: frame.height - frame.height / 2, y: 0, width: frame.width - (frame.height * 2) + ((frame.height / 2) * 2), height: frame.height)
        quantityOfItemsLabel.frame.size = CGSize(width: spacerView.frame.size.width * 0.8, height: spacerView.frame.size.height)
        quantityOfItemsLabel.center = CGPoint(x: spacerView.frame.width / 2, y: spacerView.frame.height / 2)
        setupForType()
    }
    
    private func setupForType() {
        switch type {
        case .circular:
            let buttonWidth = frame.height
            additionButton.addCornerRadius( buttonWidth / 2)
            decreaseButton.addCornerRadius(buttonWidth / 2)
            addCornerRadius(buttonWidth / 2)
        }
    }
    
    var isHiddableViewRevealead: Bool = false
    
    @objc func add() {
        quantityOfItems += 1
    }
    
    @objc func decrease() {
        quantityOfItems -= 1
    }
}
