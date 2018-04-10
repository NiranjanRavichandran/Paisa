//
//  CardTextField.swift
//  Paisa Example
//
//  Created by Niranjan Ravichandran on 4/9/18.
//  Copyright © 2018 Aviato. All rights reserved.
//

import UIKit

let CardMarginInset: CGFloat = 15

enum CardTextFieldType {
    case card
    case expiry
    case cvv
    case zip
}

class CardTextField: UITextField {
    
    convenience init(frame: CGRect, type: CardTextFieldType) {
        self.init(frame: frame)
        
        self.layer.borderWidth = 0
        self.backgroundColor = UIColor.darkGray
        self.clipsToBounds = true
        
        
        if type == .card {
            
            
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
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

