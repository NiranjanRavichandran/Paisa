//
//  CardUtility.swift
//  Paisa Example
//
//  Created by Niranjan Ravichandran on 4/12/18.
//  Copyright © 2018 Aviato. All rights reserved.
//

import UIKit

enum CardBrandType: String {
    case visa = "VISA"
    case master = "MASTER"
    case amex = "AMEX"
    case discover = "DISCOVER"
    case maestro = "MAESTRO"
    case none = "NA"
}

class CardUtility {
    
    class func getCardBrandImage(_ numbers: String) -> (image: UIImage?, brandType: CardBrandType) {
        let numbers_ : String = numbers.replacingOccurrences(of: " ", with: "") //Removing white spaces
        var cardBrand: CardBrandType = CardBrandType.none
        
        if numbers_.count == 0 {
            return (nil,  cardBrand)
        }
        
        if numbers_.first == "4" {
            return (getImage(for: .visa), .visa)
        }
        
        var toIndex = numbers_.index(numbers_.startIndex, offsetBy: 2)
        let firstTwo: String = String(describing: numbers_[..<toIndex])
        toIndex = numbers_.index(numbers_.startIndex, offsetBy: 3)
        let firstThree: String = String(describing: numbers_[..<toIndex])
        toIndex = numbers_.index(numbers_.startIndex, offsetBy: 4)
        let firstFour: String = String(describing: numbers_[..<toIndex])
        
        if let brand_ = getType(firstTwo: firstTwo) {
            cardBrand = brand_
        }else if let brand_ = getType(firstThree: firstThree) {
            cardBrand = brand_
        }else if let brand_ = getType(firstFour: firstFour) {
            cardBrand = brand_
        }
        
        if numbers.count == 6 {
            if let brand_ = getType(firstSix: numbers_) {
                cardBrand = brand_
            }
        }
        
        return (getImage(for: cardBrand),  cardBrand)
        
    }
    
    private class func getType(firstTwo: String) -> CardBrandType? {
        if ["34", "37"].contains(firstTwo) {
            return .amex
        }
        
        if firstTwo == "65" {
            return .discover
        }
        
        if let firstTwoInt = Int(firstTwo) {
            if firstTwoInt >= 50 && firstTwoInt <= 55 {
                return .master
            }
        }
        
        return nil
    }
    
    private class func getType(firstThree: String) -> CardBrandType? {
        if let first3Int = Int(firstThree) {
            if first3Int >= 644 && first3Int <= 649 {
                return .discover
            }
        }
        return nil
    }
    
    private class func getType(firstFour: String) -> CardBrandType? {
        if ["5018", "5020", "5038", "5612", "5893", "6304", "6759", "6761", "6762", "6763", "0604", "6390"].contains(firstFour) {
            return .maestro
        }else if ["6011"].contains(firstFour) {
            return .discover
        }
        
        return nil
    }
    
    private class func getType(firstSix: String) -> CardBrandType? {
        if let first6Int = Int(firstSix) {
            if first6Int >= 622126 && first6Int <= 622925 {
                return .discover
            }
        }
        
        return nil
    }
    
    private class func getImage(for type: CardBrandType) -> UIImage? {
        switch type {
        case .amex:
            return UIImage(named: "mastercard")
        case .visa:
            return UIImage(named: "visa")
        case .discover:
            return UIImage(named: "mastercard")
        case .master:
            return UIImage(named: "mastercard")
            
        default:
            return nil
        }
    }
}
