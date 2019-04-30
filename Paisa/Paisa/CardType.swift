//
//  CardType.swift
//  Paisa
//
//  Created by Niranjan Ravichandran on 4/20/19.
//  Copyright © 2019 nravichan. All rights reserved.
//

import Foundation

public enum CardType: CaseIterable {
    /// American Express
    case amex
    
    /// VISA
    case visa
    
    /// Master Card
    case master
    
    /// Maestro Card
    case mastero
    
    /// China UnionPay
    case unionPay
    
    /// JCB
    case jcb
    
    /// Discover
    case discover
    
    /// VISA Electron
    case electron
    
    /// Diners ClubCarte Blanche
    case dcb
    
    /// Diners Club International
    case dci
    
    /// Laser
    case laser
    
    /// Dankort
    case dankort
    
    /// RuPay
    case ruPay
    
    /// Verve
    case verve
    
    /// LankaPay
    case lankaPay
    
    /// No type
    case invalid
}

extension CardType {
    var requirements: (regex: String, length: [Int], grouping: [Int]) {
        let regex: String
        var grouping: [Int] = [4, 4, 4, 4], length = [16]
        
        switch self {
        case .visa: regex = #"^4\d{0,18}$"#
                    length = [13, 16, 19]
            
        case .amex: regex = #"3[47][0-9]{5,}"#
                    length = [15]
                    grouping = [4, 6, 5]
            
        case .master: regex = #"^5[0-5]\d{0,14}$"#
            
        case .mastero: regex = #"^(?:5018|5020|5038|5612|5893|6304|6759|6761|6762|6763|6390)\d{1,15}$"#
                        length = [16, 19]
            
        case .unionPay: regex = #"^(62|88)\d{0,17}$"#
                        length = [16, 19]
            
        // JCB cards either range between 3528 - 3589.
        case .jcb: regex = #"^35(2[89]|[3-8][0-9])[0-9]{0,15}$"#
                    length = [16, 19]
            
        case .discover: regex = #"^6(?:011|5[0-9]{2}|4[4-9]|(2212[6-9]|221[3-9][0-9]|22[2-8][0-9]{2}|229[01][0-9]|2292[0-5]))[0-9]{0,}$"#
                        length = [16, 19]
            
        default: regex = #"^\d{16}$"#
                 length = [16]
        }
        
        return (regex, length, grouping)
    }
}
