//
//  NJCardChecker.swift
//  Paisa
//
//  Created by Niranjan Ravichandran on 4/20/19.
//  Copyright © 2019 nravichan. All rights reserved.
//

import Foundation

struct NJCardChecker {
    
    static func checkCardType(numbers: String) -> CardType {
        // Let's clean up the string before we type check
        let filtered = numbers.replacingOccurrences(of: #"[^0-9]+"#, with: "", options: .regularExpression, range: nil)
        
        return getType(for: filtered)
    }
    
    private static func getType(for card: String) -> CardType {
        
        if isVisa(card) {
            return .visa
        }
        
        return .none
    }
    
    private static func isVisa(_ numbers: String) -> Bool {
        /*
         All VISA cards start with 4 and are of legth 16, some old cards are of length 13.
         */
        let regex = #"^4[0-9]{12}(?:[0-9]{3})?$"#
        return numbers.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
    
}
