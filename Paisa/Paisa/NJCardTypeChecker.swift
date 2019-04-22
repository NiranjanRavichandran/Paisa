//
//  NJCardChecker.swift
//  Paisa
//
//  Created by Niranjan Ravichandran on 4/20/19.
//  Copyright © 2019 nravichan. All rights reserved.
//

import Foundation

final public class NJCardChecker {
    
    
    public class func checkCardType(numbers: String) -> CardType {
        // Let's clean up the string before we type check
        let filtered = cleanUp(numbers)
        
        return getType(for: filtered)
    }
    
    private class func getType(for card: String) -> CardType {
        fatalError("Incomplete implementation")
        
        if isVisa(card) {
            return .visa
        }
        
        if isAmex(card) {
            return .master
        }
        
        return .notRecognized
    }
    
    //MARK: - Luhn's Check
    
    /// Validates given card number based on Luhn's Algorithm
    public func isValidCarNumber(_ number: String) -> Bool {
        // We need at least 9 numbers to validate the card
        if number.count < 9 {
            return false
        }
        
        // Exit here if valid number was not passed
        guard let _ = Int64(number) else {
            return false
        }
        
        var sum = 0
        let digits = number.reversed().map { String($0) }
        for tuple in digits.enumerated() {
            guard let digit = Int(tuple.element) else {
                return false
            }
            let isOddIndex = tuple.offset % 2 == 1
            
            switch (isOddIndex, digit) {
            case (true, 9):
                sum += 9
            case (true, 0...8):
                sum += (digit * 2) % 9
            default:
                sum += digit
            }
            
        }
        return sum % 10 == 0
    }
    
    /// Removes spaces, - and other special characters from the given string
    public static var cleanUp: (String) -> String = {
        return $0.replacingOccurrences(of: #"[^0-9]+"#, with: "", options: .regularExpression, range: nil)
    }
    
    // MARK: - Card Issuer Checks
    
    /// Validates if given card is a Visa Card
    public static var isVisa: (String) -> Bool = {
        /*
         All VISA cards start with 4 and are 16 digits, some old cards are of 13 digits and some new cards can be 19 digits.
         */
        let regex = #"^4[0-9]{12}(?:[0-9]{3,6})?$"#
        return $0.validate(for: regex)
    }
    
    /// Validates if given card is a Visa Card
    public static var isAmex: (String) -> Bool = {
         // All Amex cards start with 34 or 37 and total a of 15 digits.
        let regex = #"^3[47][0-9]{13}$"#
        return $0.validate(for: regex)
    }
    
    public static var isMaster: (String) -> Bool = {
        
        // Master cards either start with numbers 51 - 55 or with numbers 2221 - 2720. Total of 16 digits.
        let regex = #"^(?:5[1-5][0-9]{2}|222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720)[0-9]{12}$"#
        return $0.validate(for: regex)
    }
    
    public static var isDiscover: (String) -> Bool = {
        
        // Discover cards begin with 6011 or 65 with a total of 16 digits.
        let regex = #"^6(?:011|5[0-9]{2})[0-9]{12}$"#
        return $0.validate(for: regex)
    }
    
    public static var isJcb: (String) -> Bool = {
        // JCB cards either begin with 2131 or 1800 will have a total of 15 digits or begin with 35 and have 16  digits.
        let regex = #"^(?:2131|1800|35\d{3})\d{11}$"#
        return $0.validate(for: regex)
    }
    
    public static var isDCB: (String) -> Bool = {
        // Diners Club cards begin with 300-305
        let regex = #"^30[0-5]\d{13}$"#
        return $0.validate(for: regex)
    }
    
    /// Diners Club International
    public static var isDCI: (String) -> Bool = {
        // Diners Club cards begin with 36, 38-39
        let regex = #"^3(6|8|9)\d{14}$"#
        return $0.validate(for: regex)
    }
    
    /// Danrkort
    public static var isDankort: (String) -> Bool = {
        let regex = #"^5019$"#
        return $0.validate(for: regex)
    }
    
}
