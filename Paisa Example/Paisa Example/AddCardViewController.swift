//
//  AddCardViewController.swift
//  Paisa Example
//
//  Created by Niranjan Ravichandran on 3/21/18.
//  Copyright © 2018 Aviato. All rights reserved.
//

import UIKit

class AddCardViewController: UIViewController {
    
    var cardNumberField: PUITextField!
    var cardTemplate: PUICardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        
        cardNumberField = PUITextField.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.width, height: 60), type: .card, title: "What is your credit card number?")
        cardNumberField.center.y = self.view.frame.height/2
        self.view.addSubview(cardNumberField)
        
        cardTemplate = PUICardView(frame: CGRect.init(x: 0, y: -200, width: 300, height: 200))
        cardTemplate.contentMode = .scaleAspectFit
        cardTemplate.image = #imageLiteral(resourceName: "card-template")
        
        cardTemplate.center.x = self.view.frame.width/2
        self.view.addSubview(cardTemplate)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.75, animations: {
            self.cardTemplate.frame.origin.y = self.cardNumberField.frame.origin.y - self.cardTemplate.frame.height - 25
        }) { (_) in
            _ = self.cardNumberField.becomeFirstResponder()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}
