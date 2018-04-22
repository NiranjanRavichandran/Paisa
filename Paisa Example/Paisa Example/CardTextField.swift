//
//  CardTextField.swift
//  Paisa Example
//
//  Created by Niranjan Ravichandran on 4/9/18.
//  Copyright © 2018 Aviato. All rights reserved.
//

import UIKit

let CardMarginInset: CGFloat = 15.0

//ADT for CardsField
enum CardTextFieldType {
    case card
    case expiry
    case cvv
    case zip
}

protocol PUITextFieldDelegate {
    func didUpdateBrandLogo(image: UIImage)
}

class CardTextField: UITextField {
    
    var type: CardTextFieldType = .card

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customSetUp()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.customSetUp()
    }
    
    private func customSetUp() {
        self.layer.borderWidth = 0
        self.backgroundColor = UIColor.white
        self.textAlignment = .center
        self.clipsToBounds = true
        self.font = UIFont.systemFont(ofSize: 18)
    }
    
    //MARK: -  drawing and positioning overrides
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: CardMarginInset, dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return false
    }
    
    //Resets the text position back to the end of the field
    override func closestPosition(to point: CGPoint) -> UITextPosition? {
        let begining = self.beginningOfDocument
        let end = self.position(from: begining, offset: (self.text?.count ?? 0))
        return end
    }

}

class PUITextField: UIView, UITextFieldDelegate {
    
    private var titleLabel: UILabel!
    private var textField: CardTextField!
    private var currentBrandType: CardBrandType = .none
    var delegate: PUITextFieldDelegate?
    
    
    convenience init(frame: CGRect, type: CardTextFieldType, title: String) {
        self.init(frame: frame)
        
        titleLabel = UILabel(frame: CGRect.init(x: 0, y: 0, width: self.frame.width, height: 25))
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor.black
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(titleLabel)
        
        textField = CardTextField(frame: CGRect.init(x: 0, y: titleLabel.frame.height, width: self.frame.width, height: self.frame.height - self.titleLabel.frame.height))
        textField.delegate = self
        textField.type = type
        textField.addTarget(self, action: #selector(self.textFielDidChange(sender:)), for: .editingChanged)
        textField.keyboardType = .numberPad
        self.addSubview(textField)
        
        if type == .card {
            textField.placeholder = "CARD NUMBER"
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - Public methods
    override func becomeFirstResponder() -> Bool {
        super.becomeFirstResponder()
        self.textField.becomeFirstResponder()
        return true
    }
    
    //MARK: UITextFieldDelegate
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    @objc private func textFielDidChange(sender: UITextField) {
        if self.textField.type == .card {
            guard let text = textField.text else {
                return
            }
            if (text.count > 3 && text.count <= 7) || text.count == 0 {
                self.getBrandImage(with: text)
            }
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var maxFieldCount = 0
        let textCount =  textField.text?.count ?? 0
        let fieldType = (textField as? CardTextField)?.type
        if fieldType == .card {
            maxFieldCount = 19
            if (textCount == 4 || textCount == 9 || textCount == 14) && string != "" {
                textField.text! += " "
            }
        } else if fieldType == .expiry {
            maxFieldCount = 5
        } else if fieldType == .cvv {
            maxFieldCount = 4
        } else if fieldType == .zip {
            maxFieldCount = 5
        }
        
        if string != "" && textCount == maxFieldCount {
            return false
        }
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func getBrandImage(with numbers: String) {
        let result = CardUtility.getCardBrandImage(numbers)
        if currentBrandType != result.brandType {
            self.currentBrandType = result.brandType
            self.delegate?.didUpdateBrandLogo(image: result.image ?? UIImage())
        }
    }
    
    func getBrandImage(for type: CardBrandType) -> UIImage {
        
        return UIImage()
    }
    
    
}

