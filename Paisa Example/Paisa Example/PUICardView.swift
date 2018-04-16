//
//  PUICardView.swift
//  Paisa Example
//
//  Created by Niranjan Ravichandran on 4/10/18.
//  Copyright © 2018 Aviato. All rights reserved.
//

import UIKit

class PUICardView: UIImageView {

    private var cardNumber: UILabel!
    private var expDate: UILabel!
    private var expLabel: UILabel!
    private var brandLogo: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customizeSetUp()
        self.contentMode = .scaleAspectFit
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.customizeSetUp()
    }
    
    private func customizeSetUp() {
        brandLogo = UIImageView(frame: .init(x: 0, y: 0, width: 100, height: 75))
        brandLogo.frame.origin.x = self.frame.width - brandLogo.frame.width - 25
        brandLogo.contentMode = .scaleAspectFit
        self.addSubview(brandLogo)
        
    }
    
    func setBrandLogo(with image: UIImage) {
        self.brandLogo.image = image
    }

}
