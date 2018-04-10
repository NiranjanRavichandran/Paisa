//
//  CardsViewController.swift
//  Paisa Example
//
//  Created by Niranjan Ravichandran on 3/21/18.
//  Copyright © 2018 Aviato. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    
    var carouselview: CardsCarouselView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white

        carouselview = CardsCarouselView.init(frame: CGRect.init(x: 0, y: 0, width: (self.view.frame.width), height: 0))
        carouselview.center = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2)
        self.view.addSubview(carouselview)
        
        let card = PaymentCard(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        let card2 = PaymentCard(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        let card3 = PaymentCard(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        carouselview.appendCard(card, card2, card3)
        
        
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func appendCard(card: UIView) {
        
    }

}


class PaymentCard: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(hexCode: "#14BB5F")
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
