//
//  String+Regex.swift
//  Paisa
//
//  Created by Niranjan Ravichandran on 4/21/19.
//  Copyright © 2019 nravichan. All rights reserved.
//

import Foundation

extension String {
    
    // Validates the string against given expression
    func validate(for expression: String) -> Bool {
        return self.range(of: expression, options: .regularExpression, range: nil, locale: nil) != nil
    }
}
